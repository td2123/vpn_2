import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/routes/app_routes.dart';
import '../../../utils/color.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
   const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController splashController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        splashController.netShow = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        splashController.showIcon = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        splashController.textShow = true;
      });
    });
    Future.delayed(const Duration(milliseconds:2700), () {
      setState(() {
        splashController. lightShow = true;
      });
    }).then((v){
      Get.offNamed(AppRoutes.home);
    });
  }


  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
        systemNavigationBarColor: CColor.white,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarIconBrightness: Brightness.light),
        child: Scaffold(
          backgroundColor: CColor.white,
          body: GetBuilder<SplashController>(builder: (logic) {
            return Stack(
              children: [
              ],
            );
          }),
        )
    );
  }
}
