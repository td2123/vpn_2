import 'package:get/get.dart';
import 'package:vpn_basic_project/ui/country/controller/country_controller.dart';

class CountryBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CountryController>(()=> CountryController());
  }

}