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
    splashController.getVpnData();
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        splashController.lightShow = true;
      });
    }).then((v) {
      Get.offNamed(AppRoutes.slider);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            systemNavigationBarColor: CColor.white,
            statusBarColor: CColor.white,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
          backgroundColor: CColor.white,
          body: GetBuilder<SplashController>(builder: (logic) {
            return Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: CColor.black12.withOpacity(0.1),
                        offset: const Offset(0.0, 0.0),
                        blurRadius: 3,
                        spreadRadius: 0.5),
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      offset: Offset(0.0, 0.0),
                      blurRadius: 3,
                      spreadRadius: 0.5,
                    )
                  ],
                  image: DecorationImage(
                      image: AssetImage("assets/icons/vpn_logo.jpg")),
                ),
                // child: Image.asset("assets/icons/vpn_logo.jpg", height: 120),
              ),
            );
          }),
        ));
  }
}
