// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vpn_basic_project/utils/preference.dart';

import '../models/vpn.dart';

class Constant {

  static const responseFailureCode = 400;
  static const responseSuccessCode = 200;
  static const responseCreatedCode = 201;
  static const responseUnauthorizedCode = 401;
  static const responsePaymentRequired = 402;
  static const responseRequired = 422;
  static const responseNotFound = 404;
  static const responseServerNotWorking = 503;

  static const idResumeScreen = "idResumeScreen";

  static  int totalAttemptNativeAd = 1;
  static  int totalAttemptInterAd = 1;
  static const idShowProgressUpload = "isShowProgressUpload";
  static const idSetMainImage = "idSetMainImage";
  static const idTemplateScreen = "idTemplateScreen";
  static const idResumeData = "idResumeData";
  static const idCareerModel = "idCareerModel";
  static const idPageView = "idPageView";
  static const idPageViewBottom = "idPageViewBottom";
  static const idNetworkConnectivity = "idNetworkConnectivity";
  static const idProfessionalExperience = "idProfessionalExperience";
  static const idAddExperience = "idAddExperience";
  static const idAddCustomSection = "idAddCustomSection";
  static const idAddEduction = "idAddEduction";
  static const idAddInternShip = "idAddInternShip";
  static const idAddProject = "idAddProject";
  static const idAddReference = "idAddReference";
  static const idMainSetting = "idMainSetting";
  static const idEditScreen = "idEditScreen";
  static const idWebsite = "idWebsite";
  static const idUserLanguage = "idUserLanguage";
  static const idTemplatePreviewScreen = "idTemplatePreviewScreen";
  static const idCareer = "idCareer";
  static const idCourse = "idCourse";
  static const idCustomSection = "idCustomSection";
  static const idEducation = "idEducation";
  static const idHobbies = "idHobbies";
  static const idInternship = "idInternship";
  static const idPersonalInfo = "idPersonalInfo";
  static const idPortfolioProject = "idPortfolioProject";
  static const idReference = "idReference";
  static const idResumeLanguage = "idResumeLanguage";
  static const idResumeSetting = "idResumeSetting";
  static const idSkill = "idSkill";
  static const idPreview = "idPreview";
  static const idSplash = "idSplash";
  static const idSlider = "idSlider";
  static const idNativeAd = "idNativeAd";

  static const String dropDownTypeSkill = "dropDownTypeSkill";
  static const String dropDownTypeSize = "dropDownTypeSize";
  static const String dropDownTypeOrder = "dropDownTypeOrder";
  static const String dropDownTypeDate = "dropDownTypeDate";

  static bool adGoogle = false;
  static bool showHireMeButton = false;
  static bool isAdGoogleLoader = false;
  static bool isAdxAdLoader = false;
  static bool isFacebookAdLoader = false;
  static bool isInternshipUnlock = false;
  static bool isProjectsUnlock = false;
  static bool isWebsiteUnlock = false;
  static bool isCustomSUnlock = false;
  static bool isCustomUrlUnlock = false;
  static bool hireMeStatus = false;
  static bool switchTemplate = false;
  static bool templateAvailable = false;
  static bool isFacebookAd = false;
  static bool isShowAppBanner = false;


  static bool isUpdateData = false;

  static int percentage = 0;
  static int interAdReq = 0;
  static int interAdLoad = 0;
  static int interAdShowed = 0;
  static String guestToken = "";
  static bool isNewGuest = false;
  static String? getCustomUrl = "";
  static InterstitialAd? interGoogleAd;
  static InterstitialAd? interGoogleAdxAd;

  static List<Vpn> vpnList = Pref.vpnList;

  static bool isOffline = false;

}
