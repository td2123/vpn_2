import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewController extends GetxController {
  WebViewController controller = WebViewController();
  String string = '';
  String url = '';

  bool isTerms = true;

  // getTermsUrl()async{
  //   DatabaseReference fireBaseRef = FirebaseDatabase.instance.ref();
  //   final snapshot = await fireBaseRef.get();
  //   if (snapshot.exists) {
  //     Map<dynamic, dynamic> data = snapshot.value as Map;
  //
  //     for (int i = 0; i < data.length;) {
  //       var termsUrl = data["terms"];
  //       Preference.shared.setString(Preference.termsUrl, termsUrl);
  //       break;
  //     }
  //   }
  // }
  @override
  void onInit() {
    if (Get.arguments != null) {
      if (Get.arguments[0] != null) {
        url = Get.arguments[0];
      }
    }
    // getTermsUrl();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(url),
      );

    super.onInit();
  }

 String headerText(){
    var text = "";
    // if(url == Debug.privacyPolicy){
    //   text = "txtPrivacy".tr;
    // }else if(url == Debug.termsCondition){
    //   text = "txtTerms".tr;
    // }else if(url == Debug.aboutUs){
    //   text = "txtAboutUs".tr;
    // }else {
    //   text = "txtSupport".tr;
    // }
    return text;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
