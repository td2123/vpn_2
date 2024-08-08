import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../utils/debugs.dart';
import '../ad_helper/ad_helper.dart';

class AppLifecycleReactor {
  final AppOpenAdManager appOpenAdManager;

  AppLifecycleReactor({required this.appOpenAdManager});

  void listenToAppStateChanges() {
    AppStateEventNotifier.startListening();
    AppStateEventNotifier.appStateStream
        .forEach((state) => _onAppStateChanged(state));
  }

  void _onAppStateChanged(AppState appState) {
    Debug.printLog('New AppState state: $appState');
    if (appState == AppState.foreground) {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}

class AppOpenAdManager {
  final Duration maxCacheDuration = const Duration(hours: 4);
  DateTime? _appOpenLoadTime;

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;
  int adLoad = 0;
  int adShowCount = 0;
  int adRequest = 0;

  appOpenAds() async {
    loadAdmobAds();
  }

  void loadAdmobAds() {
    adRequest++;
    Debug.printLog("'''''''''''''ad open req $adRequest");
    AppOpenAd.load(
      adUnitId: (Debug.isAdxEnable)
          ? AdHelper.appOpenAdUnitIdAdx
          : AdHelper.openAppAdUnitId,
      // orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenLoadTime = DateTime.now();
          _appOpenAd = ad;
          adLoad++;
          Debug.printLog("'''''''''''''ad open load $adLoad");
        },
        onAdFailedToLoad: (error) {
          Debug.printLog('AppOpenAd failed to load: $error');
        },
      ),
    );
  }

  bool get isAdAvailable {
    return _appOpenAd != null;
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      debugPrint('Tried to show ad before available.');
      if(_appOpenAd != null) {
        _appOpenAd!.dispose();
      }
      _appOpenAd = null;
      appOpenAds();
      return;
    }
    if (_isShowingAd) {
      debugPrint('Tried to show ad while already showing an ad.');
      return;
    }
    if (DateTime.now().subtract(maxCacheDuration).isAfter(_appOpenLoadTime!)) {
      debugPrint('Maximum cache duration exceeded. Loading another ad.');
      if(_appOpenAd != null) {
        _appOpenAd!.dispose();
      }
      _appOpenAd = null;
      appOpenAds();
      return;
    }
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        debugPrint('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('$ad on Ad Failed To Show FullScreen Content: $error');
        _isShowingAd = false;
        // _appOpenAd!.show();
        // ad.dispose();
        // _appOpenAd = null;
        // appOpenAds();
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        Debug.printLog("'''''''''''''ad load after dismiss");
        appOpenAds();
      },
    );

    try {
      if (isAdAvailable) {
        if (Debug.isShowAd && Debug.isShowOpenAd) {
          _appOpenAd!.show().catchError((e){
            Debug.printLog("''''''''''''''ad catchError failed to show $e ");
          }).then((value) {
            adShowCount++;
            Debug.printLog("'''''''''''''ad Show $adShowCount");
          });
        }
      } else {
        Debug.printLog("'''''''''''''ad not available");
      }
    }catch(e){
      Debug.printLog("'''''''''''''ad failed to show $e ");
    }
  }
}
