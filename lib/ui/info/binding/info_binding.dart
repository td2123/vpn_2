import 'package:get/get.dart';
import 'package:vpn_basic_project/ui/info/controller/info_controller.dart';

class InfoBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<InfoController>(() => InfoController());
  }

}