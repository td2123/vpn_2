import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_basic_project/routes/app_routes.dart';
import 'package:vpn_basic_project/slider/bindings/slider_binding.dart';
import 'package:vpn_basic_project/slider/view/slider_screen.dart';
import 'package:vpn_basic_project/ui/country/binding/country_binding.dart';
import 'package:vpn_basic_project/ui/country/view/country_screen.dart';
import 'package:vpn_basic_project/ui/info/binding/info_binding.dart';
import 'package:vpn_basic_project/ui/info/view/info_screen.dart';
import 'package:vpn_basic_project/ui/splash/binding/splash_binding.dart';
import 'package:vpn_basic_project/ui/splash/view/splash_screen.dart';
import 'package:vpn_basic_project/ui/webview/binding/webview_binding.dart';
import 'package:vpn_basic_project/ui/webview/view/webview_screen.dart';
import '../ui/home/binding/home_binding.dart';
import '../ui/home/view/home_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.splash,
      page: () => Sizer(
        builder: (context, orientation, deviceType) {
          return  const SplashScreen();
        },
      ),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => Sizer(
        builder: (context, orientation, deviceType) {
          return  const HomeScreen();
        },
      ),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.country,
      page: () => Sizer(
        builder: (context, orientation, deviceType) {
          return  const CountryScreen();
        },
      ),
      binding: CountryBinding(),
    ),
    GetPage(
      name: AppRoutes.info,
      page: () => Sizer(
        builder: (context, orientation, deviceType) {
          return  const InfoScreen();
        },
      ),
      binding: InfoBinding(),
    ),
    GetPage(
      name: AppRoutes.webview,
      page: () => Sizer(
        builder: (context, orientation, deviceType) {
          return WebViewScreen();
        },
      ),
      binding: WebViewBinding(),
    ),
    GetPage(
      name: AppRoutes.slider,
      page: () => Sizer(
        builder: (context, orientation, deviceType) {
          return SliderScreen();
        },
      ),
      binding: SliderBinding(),
    ),
  ];
}
