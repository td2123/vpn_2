import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../ad/ad_helper/ad_helper.dart';
import '../utils/constant.dart';
import '../utils/debugs.dart';
import '../utils/utils.dart';

class AdLoader {
  static int index = 1;
  static bool isLoader = false;
  static bool isAdLoading = false;

  static interAdGoogle(
      Function onDismissed, Function onFailed, Function onAdLoad) {
    if (Debug.isShowAd && Debug.isShowInter) {
      if (Constant.interGoogleAd != null) {
        Utils.showLoader(Get.context!);
        Future.delayed(const Duration(milliseconds: 250), () async {
          Utils.hideLoader();
          await Constant.interGoogleAd?.show().then((value) {}).catchError((e) {
            Debug.printLog("------->>> $e ${Constant.interGoogleAd}");
          });
          onAdLoad.call();
        });
        Constant.interGoogleAd!.fullScreenContentCallback =
            FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
          Constant.interGoogleAd?.dispose();
          Constant.interGoogleAd = null;
          Constant.isAdGoogleLoader = true;
          isLoader = true;
          index++;
          AdLoader.interAdGoogle(() {}, () {}, () {});
          onDismissed.call();
        });
      } else {
        if (!isAdLoading) {
          isAdLoading = true;
          InterstitialAd.load(
            adUnitId: AdHelper.interstitialAdUnitId,
            request: const AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(
              onAdLoaded: (ad) {
                isAdLoading = false;
                Constant.interGoogleAd = ad;
              },
              onAdFailedToLoad: (err) {
                Constant.isAdGoogleLoader = true;
                isLoader = true;
                isAdLoading = false;
                Debug.printLog(
                    ":::::::::: google ad fail :::::::::: $index $err");
                onFailed.call();
              },
            ),
          );
        } else {
          onAdLoad.call();
        }
      }
    }
  }

  static interAdGoogleAdx(
      Function onDismissed, Function onFailed, Function onAdLoad) {
    if (Debug.isShowAd && Debug.isShowInter) {
      if (Constant.interGoogleAdxAd != null) {
        Utils.showLoader(Get.context!);
        Future.delayed(const Duration(milliseconds: 250), () async {
          Utils.hideLoader();
          await Constant.interGoogleAdxAd?.show().then((value) {});
          onAdLoad.call();
        });
        Constant.interGoogleAdxAd!.fullScreenContentCallback =
            FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
          Constant.interGoogleAdxAd?.dispose();
          Constant.interGoogleAdxAd = null;
          Constant.isAdxAdLoader = true;
          isLoader = true;
          index++;
          AdLoader.interAdGoogleAdx(() {}, () {}, () {});
          onDismissed.call(ad);
        });
      } else {
        if (!isAdLoading) {
          isAdLoading = true;
          InterstitialAd.load(
            adUnitId: AdHelper.interAdUnitIdAdx,
            request: const AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(
              onAdLoaded: (ad) {
                isAdLoading = false;
                Constant.interGoogleAdxAd = ad;
              },
              onAdFailedToLoad: (err) {
                Constant.isAdxAdLoader = true;
                isLoader = true;
                isAdLoading = false;
                Debug.printLog(
                    ":::::::::: google adx fail :::::::::: $index $err");
                onFailed.call();
              },
            ),
          );
        }
      }
    }
  }

  static interAdFacebook(
      Function onDismissed, Function onFailed, Function onAdLoad) {
    if (Constant.isFacebookAdLoader) {
      Utils.showLoader(Get.context!);
      Future.delayed(const Duration(milliseconds: 250), () async {
        Utils.hideLoader();

        FacebookInterstitialAd.showInterstitialAd().then((value) {
          onAdLoad.call();
        });
      });
      FacebookInterstitialAd.loadInterstitialAd(
        placementId: AdHelper.interstitialAdUnitIdFacebook,
        listener: (result, value) {
          if (result == InterstitialAdResult.LOADED) {}
          if (result == InterstitialAdResult.ERROR) {
            Constant.isFacebookAdLoader = true;
            isLoader = true;
            Debug.printLog(
                ":::::::::: facebook ad fail :::::::::: $index ${InterstitialAdResult.ERROR}");
            onFailed.call();
          }

          if (result == InterstitialAdResult.DISMISSED) {
            onDismissed.call();
            index++;
            Constant.isFacebookAdLoader = false;
            interAdFacebook(() {}, () {}, () {});
          }
        },
      );
    } else {
      FacebookInterstitialAd.loadInterstitialAd(
        placementId: AdHelper.interstitialAdUnitIdFacebook,
        listener: (result, value) {
          if (result == InterstitialAdResult.LOADED) {
            Constant.isFacebookAdLoader = true;
          }
          if (result == InterstitialAdResult.ERROR) {
            Constant.isFacebookAdLoader = true;
            isLoader = true;
            Debug.printLog(
                ":::::::::: facebook ad fail :::::::::: $index ${InterstitialAdResult.ERROR}");
            onFailed.call();
          }

          // if (result == InterstitialAdResult.DISMISSED) {
          //   onDismissed.call();
          //   index++;
          //   Constant.isFacebookAdLoader = true;
          //   FacebookInterstitialAd.destroyInterstitialAd();
          //   interAdFacebook(() {}, () {}, () {});
          // }
        },
      );
    }
  }
}
