import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:vpn_basic_project/routes/app_routes.dart';
import 'package:vpn_basic_project/ui/country/binding/country_binding.dart';
import 'package:vpn_basic_project/ui/country/view/country_screen.dart';
import '../ui/home/binding/home_binding.dart';
import '../ui/home/view/home_screen.dart';

class AppPages {
  static var list = [
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
  ];
}
