import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../utils/color.dart';
import '../../../utils/font.dart';
import '../controller/webview_controller.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({Key? key}) : super(key: key);

  final WebviewController webViewController = Get.put(WebviewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CColor.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: CColor.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: CColor.white),
      ),
      body: GetBuilder<WebviewController>(
        builder: (logic) {
          return SafeArea(
            child: Column(
              children: [
                _header(logic),
                Expanded(
                  child: WebViewWidget(
                    controller: webViewController.controller,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  _header(WebviewController logic) {
    return Container(
      color: CColor.white,
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              child: Icon(Icons.arrow_back, color: Colors.black, size: 25),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                logic.headerText(),
                style: TextStyle(
                    fontFamily: Font.nunito,
                    color: CColor.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    height: 0),
              ),
            ),
          ),
          SizedBox(width: 22)
        ],
      ),
    );
  }
}
