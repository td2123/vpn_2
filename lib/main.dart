import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'utils/preference.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await Firebase.initializeApp();
  // await Config.initConfig();
  await Pref.initializeHive();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.1)),
      child: GetMaterialApp(
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android:  CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS:  CupertinoPageTransitionsBuilder()
              }
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'VPN',
        locale: Get.deviceLocale,
        getPages: AppPages.list,
        initialRoute:  AppRoutes.home,
      ),
    );
  }
}
