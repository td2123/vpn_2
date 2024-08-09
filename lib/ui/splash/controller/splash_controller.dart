import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/ad/ads.dart';
import 'package:vpn_basic_project/ad_loader/ad_loader_mediation.dart';
import '../../../ad/app_open/app_lifecycle.dart';
import '../../../repository/repository.dart';
import '../../../utils/constant.dart';
import '../../../utils/debugs.dart';
import '../../../utils/network_connectivity.dart';

class SplashController extends GetxController {
  bool showIcon = false;
  bool netShow = false;
  bool lightShow = false;
  bool textShow = false;
  Map source = {ConnectivityResult.none: false};
  final NetworkConnectivity networkConnectivity = NetworkConnectivity.instance;
  String string = '';
  bool isLoadData = true;
  String version = "";
  String userToken = "";
  late AppLifecycleReactor _appLifecycleReactor;

  @override
  void onInit() {
    networkConnectivity.initialise();
    networkConnectivity.myStream.listen((source) async {
      source = source;
      switch (source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.wifi:
          string = source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Offline';
      }
      update();
      // 3.
      update();
      if (string == "Online" && isLoadData) {
        isLoadData = false;
        if (Debug.isShowAd && Debug.isShowOpenAd) {
          AppOpenAdManager appOpenAdManager = AppOpenAdManager()..appOpenAds();
          _appLifecycleReactor =
              AppLifecycleReactor(appOpenAdManager: appOpenAdManager);
          _appLifecycleReactor.listenToAppStateChanges();
        }
        adData();
      } else if (string == "Offline" && Constant.isOffline) {
        isLoadData = true;
        Constant.isOffline = false;
      }
    });
    super.onInit();
  }

  Future<void> adData() async {
    try {
      if (kDebugMode) {
        const Map<String, dynamic> value = {
          "adsBool": {
            "isShowAd": true,
            "isShowInter": true,
            "isShowBanner": true,
            "isShowOpen": true,
            "isInterConnectVPN": true,
            "isInterSelectCountry": true,
            "isShowBannerCountry": true,
            "isShowBannerInfo": true,
            "isPreloading": true
          },
          "ads": {
            "android": {
              "adx": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "native": "ca-app-pub-3940256099942544/2247696110"
              },
              "facebook": {
                "inter": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                "native": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
              },
              "google": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "native": "ca-app-pub-3940256099942544/2247696110"
              },
              "adType": "g",
              "adxEnable": false
            },
            "ios": {
              "adx": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "native": "ca-app-pub-3940256099942544/2247696110"
              },
              "facebook": {
                "inter": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                "native": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
              },
              "google": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "native": "ca-app-pub-3940256099942544/2247696110"
              },
              "adType": "g",
              "adxEnable": false
            }
          },
          "other": {
            "terms": "https://resume-builder-frontend-cloned.vercel.app/terms",
            "privacy":
                "https://resume-builder-frontend-cloned.vercel.app/privacy",
          },
        };
        var data = value;
        /*Ads id*/
        if (defaultTargetPlatform == TargetPlatform.android) {
          var adsData = data["ads"]["android"];
          Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
          Debug.adType = adsData[Debug.keyNameAdType];
          Debug.googleAdxInterstitial = adsData[Debug.keyNameIsAdx]["inter"];
          Debug.googleAdxOpenApp = adsData[Debug.keyNameIsAdx]["openApp"];
          Debug.googleAdxNative = adsData[Debug.keyNameIsAdx]["native"];
          Debug.googleAdMobInterstitial =
              adsData[Debug.keyNameAdTypeGoogle]["inter"];
          Debug.googleAdMobNative =
              adsData[Debug.keyNameAdTypeGoogle]["native"];
          Debug.googleAdMobOpenApp =
              adsData[Debug.keyNameAdTypeGoogle]["openApp"];
          Debug.facebookInterstitial =
              adsData[Debug.keyNameAdTypeFaceBook]["inter"];
          Debug.facebookBanner = adsData[Debug.keyNameAdTypeFaceBook]["native"];
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          var adsData = data["ads"]["ios"];
          Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
          Debug.adType = adsData[Debug.keyNameAdType];
          Debug.googleAdxInterstitial = adsData[Debug.keyNameIsAdx]["inter"];
          Debug.googleAdxOpenApp = adsData[Debug.keyNameIsAdx]["openApp"];
          Debug.googleAdxNative = adsData[Debug.keyNameIsAdx]["native"];
          Debug.googleAdMobInterstitial =
              adsData[Debug.keyNameAdTypeGoogle]["inter"];
          Debug.googleAdMobOpenApp =
              adsData[Debug.keyNameAdTypeGoogle]["openApp"];
          Debug.googleAdMobNative =
              adsData[Debug.keyNameAdTypeGoogle]["native"];
          Debug.facebookInterstitial =
              adsData[Debug.keyNameAdTypeFaceBook]["inter"];
          Debug.facebookBanner = adsData[Debug.keyNameAdTypeFaceBook]["native"];
          Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
        }

        /*Ads Bool*/
        var adsBool = data["adsBool"];
        Debug.isShowAd = adsBool[Debug.keyNameIsShowAd];
        Debug.isShowOpenAd = adsBool[Debug.keyNameIsShowOpenAd];
        Debug.isShowInter = adsBool[Debug.keyNameIsShowInter];
        Debug.isShowBanner = adsBool[Debug.keyNameIsShowBanner];
        Debug.isPreloading = adsBool[Debug.keyNameIsPreloading];
        Debug.isInterSelectCountry = adsBool[Debug.keyNameIsInterSelectCountry];
        Debug.isInterConnectVPN = adsBool[Debug.keyNameIsInterConnectVPN];
        Debug.isShowBannerCountry = adsBool[Debug.keyNameIsShowBannerCountry];
        Debug.isShowBannerInfo = adsBool[Debug.keyNameIsShowBannerInfo];
        // Debug.isShowAd = false;

        /*Other Data*/
        var otherData = data["other"];
        Debug.termsCondition = otherData[Debug.keyTermsCondition];
        Debug.privacyPolicy = otherData[Debug.keyPrivacyPolicy];
      } else {
        await Repo.getAdData().then((value) async {
          var data = value;
          if (data != null) {
            if (defaultTargetPlatform == TargetPlatform.android) {
              var adsData = data["ads"]["android"];
              Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
              Debug.adType = adsData[Debug.keyNameAdType];
              Debug.googleAdxInterstitial =
                  adsData[Debug.keyNameIsAdx]["inter"];
              Debug.googleAdxOpenApp = adsData[Debug.keyNameIsAdx]["openApp"];
              Debug.googleAdxNative = adsData[Debug.keyNameIsAdx]["native"];
              Debug.googleAdMobInterstitial =
                  adsData[Debug.keyNameAdTypeGoogle]["inter"];
              Debug.googleAdMobNative =
                  adsData[Debug.keyNameAdTypeGoogle]["native"];
              Debug.googleAdMobOpenApp =
                  adsData[Debug.keyNameAdTypeGoogle]["openApp"];
              Debug.facebookInterstitial =
                  adsData[Debug.keyNameAdTypeFaceBook]["inter"];
              Debug.facebookBanner =
                  adsData[Debug.keyNameAdTypeFaceBook]["native"];
            } else if (defaultTargetPlatform == TargetPlatform.iOS) {
              var adsData = data["ads"]["ios"];
              Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
              Debug.adType = adsData[Debug.keyNameAdType];
              Debug.googleAdxInterstitial =
                  adsData[Debug.keyNameIsAdx]["inter"];
              Debug.googleAdxOpenApp = adsData[Debug.keyNameIsAdx]["openApp"];
              Debug.googleAdxNative = adsData[Debug.keyNameIsAdx]["native"];
              Debug.googleAdMobInterstitial =
                  adsData[Debug.keyNameAdTypeGoogle]["inter"];
              Debug.googleAdMobOpenApp =
                  adsData[Debug.keyNameAdTypeGoogle]["openApp"];
              Debug.googleAdMobNative =
                  adsData[Debug.keyNameAdTypeGoogle]["native"];
              Debug.facebookInterstitial =
                  adsData[Debug.keyNameAdTypeFaceBook]["inter"];
              Debug.facebookBanner =
                  adsData[Debug.keyNameAdTypeFaceBook]["native"];
              Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
            }

            /*Ads Bool*/
            var adsBool = data["adsBool"];
            Debug.isShowAd = adsBool[Debug.keyNameIsShowAd];
            Debug.isShowOpenAd = adsBool[Debug.keyNameIsShowOpenAd];
            Debug.isShowInter = adsBool[Debug.keyNameIsShowInter];
            Debug.isShowBanner = adsBool[Debug.keyNameIsShowBanner];
            Debug.isPreloading = adsBool[Debug.keyNameIsPreloading];
            Debug.isInterSelectCountry =
                adsBool[Debug.keyNameIsInterSelectCountry];
            Debug.isInterConnectVPN = adsBool[Debug.keyNameIsInterConnectVPN];
            Debug.isShowBannerCountry =
                adsBool[Debug.keyNameIsShowBannerCountry];
            Debug.isShowBannerInfo = adsBool[Debug.keyNameIsShowBannerInfo];
            // Debug.isShowAd = false;

            /*Other Data*/
            var otherData = data["other"];
            Debug.termsCondition = otherData[Debug.keyTermsCondition];
            Debug.privacyPolicy = otherData[Debug.keyPrivacyPolicy];
          }
        });
      }
      Ads.precacheNativeAd();
      AdLoaderMediation.interMediation(() {});
    } catch (e) {
      Debug.printLog("------>>>> hello get data error $e");
    }
  }
}
