// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';

class Debug {

  static printLog(dynamic value) {
    if(kDebugMode) {
      debugPrint(value);
    }
  }

  static var isShowAd = true;
  static var isPreloading = false;
  static var isShowBanner = true;
  static var isShowOpenAd = true;
  static var isShowRewarded = true;
  static var isShowInter = true;
  static var isShowNative = true;
  static var isAdxEnable = true;
  static var isInterSplash = true;
  static var isNativeSetting = true;
  static var isNativeBottomSheet = true;
  static var isNativeCareer = true;
  static var isNativeExperience = true;
  static var isNativeEduction = true;
  static var isNativeSkill = true;
  static var isNativeLanguage = true;
  static var isNativeHobbies = true;
  static var isNativeCourse = true;
  static var isNativeReference = true;
  static var isNativeProject = true;
  static var isNativeInternship = true;
  static var isNativeWebsite = true;
  static var isNativeCustomSection = true;
  static var isNativeSlider = true;
  static var isInterSaveButton = true;
  static var isInterSelectTemplate = true;
  static var isFineReview = true;
  static var isShowBannerAdEdit = true;
  static var isShowBannerAdArrange = true;
  static var isInterHomeResumeView = true;
  static var isInterHomeBottomSheetView = true;
  static var isInterHomeBottomSheetEdit = true;
  static var isInterHomeExploreView = true;
  static var isInterExploreView = true;
  static var isInterPreviewLockTemplate = true;
  static var isInterPreviewDownloadHeader = true;
  static var isInterPreviewDownloadBottom = true;
  static var isInterSwitchTemplate = true;
  static var isInterArrangementPreviewHeader = true;
  static var isInterArrangementPreviewBottom = true;
  static var isInterArrangementSave = true;
  static var isInterSkip = true;
  static var isInterPreviewTap = true;
  static var isInterEditPreviewHeader = true;
  static var isInterEditView = true;
  static var isInterEditDownload = true;
  static var isInterEditDuplicate = true;
  static var isInterEditPreviewBottom = true;
  static var isInterEditDownloadBottom = true;
  static var isImportPDF = true;
  static var totalAdInterCount = 0;
  static var resumeLimit = 0;

  static var keyNameIsShowAd = "isShowAd";
  static var keyNameIsPreloading = "isPreloading";
  static var keyNameIsShowBanner = "isShowBanner";
  static var keyNameIsShowRewarded = "isShowRewarded";
  static var keyNameIsShowOpenAd = "isShowOpen";
  static var keyNameIsShowInter = "isShowInter";
  static var keyNameIsNativeAd = "isShowNative";
  static var keyNameIsAdxEnable = "adxEnable";
  static var keyNameIsAdx = "adx";
  static var keyNameIsAndroid = "android";
  static var keyNameIsIos = "ios";
  static var keyNameAppAd = "appAd";
  static var keyNameAppAdLogo = "appLogoUrl";
  static var keyNameAppAdName = "appName";
  static var keyNameAppAdRating = "appRating";
  static var keyNameIsImportPDF = "isImportPDF";
  static var keyNameAppAdUrl = "url";
  static var keyNameImgUrl = "imgURL";
  static var keyNameBanners = "banners";

  static var googleAdMobBanner = "";
  static var googleAdMobInterstitial = "";
  static var googleAdMobRewarded = "";
  static var googleAdMobOpenApp = "";
  static var googleAdMobNative = "";

  static var googleAdxBanner = "";
  static var googleAdxInterstitial = "";
  static var googleAdxRewarded = "";
  static var googleAdxOpenApp = "";
  static var googleAdxNative = "";

  static var facebookBanner = "";
  static var facebookInterstitial = "";
  static var facebookRewarded = "";
  static var facebookOpenApp = "";
  static var facebookNative = "";
  static var facebookNativeSmall = "";
  static var facebookNativeBanner = "";

  static var productIdIosMonthly = "";
  static var productIdIosYearly = "";
  static var productIdAndroidMonthly = "";
  static var productIdAndroidYearly = "";

  static var productPrice;
  static var currencySymbol;



  static var keyNameAdType = "adType";
  static var keyNameAdTypeGoogle = "google";
  static var keyNameAdTypeFaceBook = "facebook";
  static var keyNameGoogleBanner = "googleBanner";
  static var keyNameGoogleInterstitial = "googleInterstitial";
  static var keyNameGoogleRewarded = "googleRewarded";
  static var keyNameGoogleOpenApp = "googleOpenApp";
  static var keyNameGoogleNative = "googleNative";
  static var keyNameFacebookInter = "facebookInter";
  static var keyNameFacebookRewarded = "facebookRewarded";
  static var keyNameFacebookNative = "facebookNative";
  static var keyNameHomeInterAd = "Inter_Home";
  static var keyNameBannerAdEdit = "isShowBannerEdit";
  static var keyNameBannerAdArrange = "isShowBannerArrange";
  static var keyNameEditScreenInterAd = "Inter_Edit_screen";
  static var keyNameSplashInterAd = "Inter_Splash";
  static var keyNameResumeViewInterAd = "Inter_Resume_View";
  static var keyNameResumeDownloadInterAd = "Inter_Resume_Download";
  static var keyNameResumeDuplicateInterAd = "Inter_Resume_Duplicate";
  static var keyNameInterHomeBottomSheetView = "Inter_Home_Bottom_Sheet_View";
  static var keyNameInterHomeResume = "Inter_Home_Resume_View";
  static var keyNameInterHomeBottomSheetEdit = "Inter_HomeBottom_Sheet_Edit";
  static var keyNameInterHomeExploreView = "Inter_Home_Explore_View";
  static var keyNameInterExploreView = "Inter_Explore_View";
  static var keyNameInterPreviewLockTemplate = "Inter_Preview_Lock_Template";
  static var keyNameInterPreviewDownloadHeader = "Inter_Preview_Download_Header";
  static var keyNameInterPreviewDownloadBottom = "Inter_Preview_Download_Bottom";
  static var keyNameInterSwitchTemplate = "Inter_Switch_Template";
  static var keyNameInterArrangementPreviewHeader = "Inter_Arrangement_Preview_Header";
  static var keyNameInterArrangementPreviewBottom = "Inter_Arrangement_Preview_Bottom";
  static var keyNameInterArrangementSave = "Inter_Arrangement_Save";
  static var keyNameInterSkip = "Inter_Free_Button";
  static var keyNameInterPreviewTap = "Inter_Preview_Tap";
  static var keyNameInterEditPreviewHeader = "Inter_Edit_Preview_Header";
  static var keyNameInterEditView = "Inter_Edit_View";
  static var keyNameInterEditDownload = "Inter_Edit_Download";
  static var keyNameInterEditDuplicate = "Inter_Edit_Duplicate";
  static var keyNameInterEditPreviewBottom = "Inter_Edit_Preview_Bottom";
  static var keyNameInterEditDownloadBottom = "Inter_Edit_Download_Bottom";
  static var keyNameTemplateBottomSheetNative = "Template_Bottom_Sheet_Native";
  static var keyNameCareerNative = "Native_Career";
  static var keyNameExperienceNative = "Native_Experience";
  static var keyNameEductionNative = "Native_Eduction";
  static var keyNameSkillNative = "Native_Skill";
  static var keyNameLanguageNative = "Native_Language";
  static var keyNameHobbiesNative = "Native_Hobbies";
  static var keyNameCourseNative = "Native_Course";
  static var keyNameReferenceNative = "Native_Reference";
  static var keyNameProjectNative = "Native_Project";
  static var keyNameInternshipNative = "Native_Internship";
  static var keyNameWebsiteNative = "Native_Website";
  static var keyNameCustomSectionNative = "Native_CustomSection";
  static var keyNameHomeNative = "Native_Home";
  static var keyNameSettingNative = "Native_Setting";
  static var keyNameSliderNative = "Native_Slider";
  static var keyNameSaveButtonInterAd = "Inter_Save_Button";
  static var keyNameSelectTemplateInterAd = "Inter_Select_Template";
  static var keyNameFacebookAppId = "facebook_app_id";
  static var keyNameFacebookClientToken = "client_token";


  static var adGoogleType = "g";
  static var adFacebookType = "f";
  static var adType = adFacebookType;

  static var keyTermsCondition = "terms";
  static var termsCondition = "";

  static var keyDownloadUrl = "downloadUrl";
  static var downloadUrl = "";

  static var keyPrivacyPolicy = "privacy";
  static var privacyPolicy = "";

  static var androidAppId = 0;
  static var iosAppId = 0;

  static var keyShareUrl = "shareUrl";
  static var shareUrl = "";

  static var keySupport = "support";
  static var support = "";

  static var keyBaseUrl = "baseURL";
  static var keyNameTotalAdInterCount = " totalAdInterCount";
  static var keyNameResumeLimit = "resumeLimit";

  static var appLogoUrl;
  static var appName;
  static var appRating;
  static var url;


  static var keyNameReview = "isFineReview";


  static var deviceType = "";

  static var bannersAdImgUrl = "";
  static var bannersAdUrl = "";

}
