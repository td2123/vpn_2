import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/ad/ads.dart';
import '../../../ad/app_open/app_lifecycle.dart';
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
            "Inter_Home": false,
            "Inter_Resume_Download": true,
            "Inter_Resume_Duplicate": true,
            "Inter_Resume_View": true,
            "Inter_Save_Button": true,
            "isShowAd": true,
            "isShowInter": true,
            "isShowOpen": true,
            "isShowBannerEdit": true,
            "isShowBannerArrange": true,
            "isPreloading" : false
          },
          "ads": {
            "android": {
              "adx": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "banner": "ca-app-pub-3940256099942544/9214589741"
              },
              "facebook": {
                "inter": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                "banner": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID"
              },
              "google": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "banner": "ca-app-pub-3940256099942544/9214589741"
              },
              "adType": "g",
              "adxEnable": false
            },
            "ios": {
              "adx": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "banner": "ca-app-pub-3940256099942544/9214589741"
              },
              "facebook": {
                "inter": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                "banner": "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID"
              },
              "google": {
                "inter": "ca-app-pub-3940256099942544/1033173712",
                "openApp": "ca-app-pub-3940256099942544/9257395921",
                "banner": "ca-app-pub-3940256099942544/9214589741"
              },
              "adType": "g",
              "adxEnable": false
            }
          },
          "other": {
            "resumeLimit": 2,
            "isFineReview": true,
            "isSubscription": false,
            "shareUrl": "https://snowresume.com/r/",
            "terms": "https://resume-builder-frontend-cloned.vercel.app/terms",
            "privacy":
                "https://resume-builder-frontend-cloned.vercel.app/privacy",
            "support": "https://support-resume.web.app",
            "baseURL": "https://stq7twcobd.execute-api.us-east-1.amazonaws.com",
            "downloadUrl":
                "https://stq7twcobd.execute-api.us-east-1.amazonaws.com/api/resume/pdf/",
            "aboutUs": "https://resume-builder-frontend-cloned.vercel.app/about"
          },
          "slider": [
            {
              "description":
                  "Craft eye-catching resumes that grab the attention of employers and land your dream job with our user-friendly resume builder.",
              "heading": "Create Resumes That Get Noticed",
              "img": "https://zresume.web.app/images/resume1.png"
            },
            {
              "description":
                  "Simplify the resume creation process and pave the way for a brighter career with our intuitive and efficient resume builder.",
              "heading": "Resumes Made Simple, Careers Made Bright",
              "img": "https://zresume.web.app/images/resume2.png"
            },
            {
              "description":
                  "Take charge of your job search and boost your prospects by using our powerful resume builder, designed to give you the edge in today's competitive job market.",
              "heading": "Empower Your Job Search",
              "img": "https://zresume.web.app/images/resume3.png"
            }
          ],
          "fbmarketing": {
            "android": {
              "facebook_app_id": "1175965093101564",
              "client_token": "26dbbb6ba21a41e9da456c98ab7d5acd"
            },
            "ios": {
              "facebook_app_id": "1175965093101564",
              "client_token": "26dbbb6ba21a41e9da456c98ab7d5acd"
            }
          },
          "subscription": {
            "android": {
              "monthly": "1_month_subscription",
              "yearly": "resume_yearly"
            },
            "ios": {"monthly": "month", "yearly": "resume_yearly"}
          },
          "appId": {"android": null, "ios": null}
        };
        var data = value;
        /*Slider Data*/

        /*Ads id*/
        if (defaultTargetPlatform == TargetPlatform.android) {
          var adsData = data["ads"]["android"];
          Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
          Debug.adType = adsData[Debug.keyNameAdType];
          Debug.googleAdxInterstitial = adsData[Debug.keyNameIsAdx]["inter"];
          Debug.googleAdxOpenApp = adsData[Debug.keyNameIsAdx]["openApp"];
          Debug.googleAdxBanner = adsData[Debug.keyNameIsAdx]["banner"];
          Debug.googleAdMobInterstitial =
              adsData[Debug.keyNameAdTypeGoogle]["inter"];
          Debug.googleAdMobOpenApp =
              adsData[Debug.keyNameAdTypeGoogle]["openApp"];
          Debug.googleAdMobBanner =
              adsData[Debug.keyNameAdTypeGoogle]["banner"];
          Debug.facebookInterstitial =
              adsData[Debug.keyNameAdTypeFaceBook]["inter"];
          Debug.facebookBanner = adsData[Debug.keyNameAdTypeFaceBook]["banner"];
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          var adsData = data["ads"]["ios"];
          Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
          Debug.adType = adsData[Debug.keyNameAdType];
          Debug.googleAdxInterstitial = adsData[Debug.keyNameIsAdx]["inter"];
          Debug.googleAdxOpenApp = adsData[Debug.keyNameIsAdx]["openApp"];
          Debug.googleAdxBanner = adsData[Debug.keyNameIsAdx]["banner"];
          Debug.googleAdMobInterstitial =
              adsData[Debug.keyNameAdTypeGoogle]["inter"];
          Debug.googleAdMobOpenApp =
              adsData[Debug.keyNameAdTypeGoogle]["openApp"];
          Debug.googleAdMobBanner =
              adsData[Debug.keyNameAdTypeGoogle]["banner"];
          Debug.facebookInterstitial =
              adsData[Debug.keyNameAdTypeFaceBook]["inter"];
          Debug.facebookBanner = adsData[Debug.keyNameAdTypeFaceBook]["banner"];
          Debug.isAdxEnable = adsData[Debug.keyNameIsAdxEnable];
        }

        /*Subscription Data*/
        var subscriptionData = data["subscription"];
        Debug.productIdIosMonthly =
            subscriptionData[Debug.keyNameIsIos]["monthly"];
        Debug.productIdIosYearly =
            subscriptionData[Debug.keyNameIsIos]["yearly"];
        Debug.productIdAndroidMonthly =
            subscriptionData[Debug.keyNameIsAndroid]["monthly"];
        Debug.productIdAndroidYearly =
            subscriptionData[Debug.keyNameIsAndroid]["yearly"];

        /*Ads Bool*/
        var adsBool = data["adsBool"];
        Debug.isShowAd = adsBool[Debug.keyNameIsShowAd];
        Debug.isShowOpenAd = adsBool[Debug.keyNameIsShowOpenAd];
        Debug.isShowInter = adsBool[Debug.keyNameIsShowInter];
        Debug.isInterSaveButton = adsBool[Debug.keyNameSaveButtonInterAd];
        Debug.isPreloading = adsBool[Debug.keyNameIsPreloading];
        // Debug.isShowAd = false;

        /*Other Data*/
        var otherData = data["other"];
        Debug.termsCondition = otherData[Debug.keyTermsCondition];
        Debug.privacyPolicy = otherData[Debug.keyPrivacyPolicy];
        Debug.downloadUrl = otherData[Debug.keyDownloadUrl];
        Debug.shareUrl = otherData[Debug.keyShareUrl];
        Debug.support = otherData[Debug.keySupport];
        Debug.resumeLimit = otherData[Debug.keyNameResumeLimit];
        Debug.isFineReview = otherData[Debug.keyNameReview];

        /*App Id*/
        var appId = data["appId"];
        Debug.androidAppId = appId["android"] ?? 0;
        Debug.iosAppId = appId["ios"] ?? 0;
        Ads.precacheNativeAd();
      } else {

      }
    } catch (e) {
      Debug.printLog("------>>>> hello get data error $e");
    }
  }

}
