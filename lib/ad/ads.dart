import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vpn_basic_project/ad/ad_helper/ad_helper.dart';
import 'package:vpn_basic_project/ad/native_ad_controller.dart';
import '../utils/debugs.dart';

class Ads {

  static NativeAd? _nativeAd;
  static bool _nativeAdLoaded = false;



  //*****************Native Ad******************

  static void precacheNativeAd() {
    log('Precache Native Ad - Id: ${AdHelper.nativeAdUnitId}');

    if (Debug.isShowAd) return;

    _nativeAd = NativeAd(
        adUnitId: AdHelper.nativeAdUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            log('$NativeAd loaded.');
            _nativeAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            _resetNativeAd();
            log('$NativeAd failed to load: $error');
          },
        ),
        request: const AdRequest(),
        // Styling
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.small))
      ..load();
  }

  static void _resetNativeAd() {
    _nativeAd?.dispose();
    _nativeAd = null;
    _nativeAdLoaded = false;
  }

  static NativeAd? loadNativeAd({required NativeAdController adController}) {
    log('Native Ad Id: ${AdHelper.nativeAdUnitId}');

    if (!Debug.isShowAd) return null;

    if (_nativeAdLoaded && _nativeAd != null) {
      adController.adLoaded.value = true;
      return _nativeAd;
    }

    return NativeAd(
        adUnitId: AdHelper.nativeAdUnitId,
        request: const AdRequest(),
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            log('$NativeAd loaded.');
            adController.adLoaded.value = true;
            _resetNativeAd();
            precacheNativeAd();
          },
          onAdFailedToLoad: (ad, error) {
            _resetNativeAd();
            log('$NativeAd failed to load: $error');
          },
        ),
        nativeTemplateStyle:
            NativeTemplateStyle(templateType: TemplateType.small))
      ..load();
  }

  //*****************Rewarded Ad******************

  static void showRewardedAd({required VoidCallback onComplete}) {
    log('Rewarded Ad Id: ${AdHelper.rewardedAdUnitId}');

    if (Debug.isShowAd) {
      onComplete();
      return;
    }


    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          Get.back();

          //reward listener
          ad.show(
              onUserEarnedReward: (AdWithoutView ad, RewardItem rewardItem) {
            onComplete();
          });
        },
        onAdFailedToLoad: (err) {
          Get.back();
          log('Failed to load an interstitial ad: ${err.message}');
          // onComplete();
        },
      ),
    );
  }
}
