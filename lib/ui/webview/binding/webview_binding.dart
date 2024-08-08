import 'package:get/get.dart';

import '../controller/webview_controller.dart';

class WebViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<WebviewController>(
      () => WebviewController(),
    );
  }
}
