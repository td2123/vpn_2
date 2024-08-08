// ignore_for_file: prefer_typing_uninitialized_variables
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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

  static const languageEn = "en";
  static const countryCodeEn = "US";
  static const languageIn = "hi";
  static const countryCodeIn = "IN";
  static const languageFr = "fr";
  static const countryCodeFr = "FR";
  static const languagePt = "pt";
  static const countryCodePt = "PT";
  static const languageSp = "es";
  static const countryCodeSp = "ES";
  static const languageKo = "ko";
  static const countryCodeKo = "Ko";
  static const languageId = "id";
  static const countryCodeId = "ID";
  static const languageUr = "ur";
  static const countryCodeUr = "PK";
  static const languageRus = "rus";
  static const countryCodeRus = "RU";
  static const languageBn = "bn";
  static const countryCodeBn = "BN";
  static const languageZh = "zh";
  static const countryCodeZh = "CN";
  static const languageAr = "ar";
  static const countryCodeAr = "SA";

  static String userReferDara = "";

  static RxList<String> text = <String>[
    'Grid with star rating',
    'Grid with text rating',
    ' Text without rating',
    ' Text with rating',
  ].obs;
  static RxList<String> size = <String>[
    'Normal',
    'Smaller',
  ].obs;
  static RxList<String> place = <String>[
    'My current job on first place',
    'The first job on first place'
  ].obs;
  static RxList<String> format = <String>[
    '13 March 2023',
    '03/13/2023',
    'March 13,2023',
    '03-13-2023',
    '13-03-2023',
  ].obs;

  static RxList<String> language = <String>[
    'Chinese',
    'English',
    'French ',
    'German',
    'Hindi ',
    'Indonesian ',
    'Italian',
    'Polish ',
    'Portuguese',
    'Russian',
    'Spanish',
    'Ukrainian'
  ].obs;


  static List<String> skillSuggestion = <String>[
  "Multitasking ",
  "Effective Time Management",
  "Fast Learner",
  "Adaptability",
  "Computer Skills",
  "Customer Service",
  "Microsoft Office",
  "Leadership Skills",
  "Problem Solving Skills",
  "Business Development Strategies",
  "Effective Team Leader",
  "Time Management Skills",
  "Gaming",
  "Interpersonal Communication Skills",
  "Technical Writing",
  "Programming Languages (Java, Python, C++, etc.)",
  "Database Management",
  "Software Development Life Cycle (SDLC)",
  "Agile Methodology",
  "Cloud Computing",
  "Data Analytics",
  "Networking",
  "Project Management",
  "Critical Thinking",
  "Financial Analysis",
  "Marketing",
  "Sales",
  "Negotiation Skills",
  "Public Speaking"];

  static List<String> emptySkillSuggestion = <String>[
    "Multitasking ",
    "Effective Time Management",
    "Fast Learner",
    "Adaptability",
    "Computer Skills",
    "Customer Service",
    "Microsoft Office",
    "Leadership Skills",
    "Problem Solving Skills",
    "Business Development Strategies",
    "Effective Team Leader",
    "Time Management Skills",
    "Gaming",
    "Interpersonal Communication Skills",
    "Technical Writing",
    "Programming Languages (Java, Python, C++, etc.)",
    "Database Management",
    "Software Development Life Cycle (SDLC)",
    "Agile Methodology",
    "Cloud Computing",
    "Data Analytics",
    "Networking",
    "Project Management",
    "Critical Thinking",
    "Financial Analysis",
    "Marketing",
    "Sales",
    "Negotiation Skills",
    "Public Speaking"];


  static List<String> languageSuggestion = <String>[
    "English",
    "Spanish",
    "German",
    "Portuguese",
    "Chinese",
    "Dutch",
    "Hindi",
    "Marathi",
    "Gujarati",
  ];

  static List<String> emptyLanguageSuggestion = <String>[
    "English",
    "Spanish",
    "German",
    "Portuguese",
    "Chinese",
    "Dutch",
    "Hindi",
    "Marathi",
    "Gujarati",
  ];

  static List<String> skillSuggestionRemoved = <String>[];
  static List<String> languageSuggestionRemoved = <String>[];

  static RxList<String> dropdownValues =
      <String>['Basic', 'Average', 'Proficient', 'Advanced', 'Expert'].obs;

  static const idDateTimeController = 'idDateTimeController';
  static var mainURL = "";

  static bool isCreateResume = false;
  static bool isEdit = false;
  static String resumeId = "";
  static bool isEmail = false;
  static bool isNotification = false;
  static bool isStorage = false;
  static bool isGetNotificationPermission = false;
  static bool isGetStoragePermission = false;
  static bool isShowDropDown = false;
  static bool isOffline = false;
  static bool isExplore = false;
  static bool isExport = false;


  static bool templateFill = false;
  static bool personalInfoFill = false;
  static bool careerFill = false;
  static bool experienceFill = false;
  static bool eductionFill = false;
  static bool skillFill = false;
  static bool languageFill = false;
  static bool hobbiesFill = false;
  static bool certificationFill = false;
  static bool referenceFill = false;
  static bool projectFill = false;
  static bool internshipFill = false;
  static bool websiteFill = false;
  static bool customSecFill = false;
}
