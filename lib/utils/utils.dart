import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'debugs.dart';
import 'network_connectivity.dart';

class Utils {

  static showToast(BuildContext context, String msg) {
    return Fluttertoast.showToast(msg: msg);
  }

  static Future<void> sendData(String path) async {
    const platform = MethodChannel("resumeMethodChannel");
    try {
      await platform.invokeMethod('resumePathMethod', {"path": path});
    } on PlatformException catch (e) {
      Debug.printLog("e.message....${e.message}");
    }
  }

  static Future<void> facebookId(String appId,String clientToken) async {
    const platform = MethodChannel("resumeMethodChannel");
    try {
      await platform.invokeMethod('fbMarketing',
          {"appId": appId, "clientToken": clientToken});
    } catch (e) {
      Debug.printLog("e.message....$e");
    }
  }

  static networkConnection(
      String string, NetworkConnectivity networkConnectivity) {
    networkConnectivity.initialise();
    networkConnectivity.myStream.listen((source) async {
      source = source;
      // 1.
      switch (source.keys.toList()[0]) {
        case ConnectivityResult.mobile:
          string = source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.wifi:
          string = source.values.toList()[0] ? 'Online' : 'Offline';
          break;
        case ConnectivityResult.none:
        default:
          string = 'Offline';
      }
      // 3.
      Debug.printLog("connection status=====>>>>>>>$string");
    });
  }

  static showLoader(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              // borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(35),
            height: Get.height,
            width:Get.width,
            child: LottieBuilder.asset('assets/lottie/loader.json',
                height: Get.height * 0.5),
          ),
        );
      },
    );
  }

  static void hideLoader() {
   Navigator.pop(Get.context!);
  }

  // static Future<void> configureFacebook(String appId, String clientToken) async {
  //
  //   const channel = MethodChannel('fbMarketing');
  //   try {
  //     await channel.invokeMethod('configureFacebook', {
  //       'appId': appId,
  //       'clientToken': clientToken,
  //     });
  //   } on PlatformException catch (e) {
  //     Debug.printLog("Failed to configure Facebook: '${e.message}'.");
  //   }
  // }

  static Future<String?> getReferrerUrl() async {
    const channel = MethodChannel('resumeMethodChannel');
    try {
      final String? referrerUrl = await channel.invokeMethod('getReferrerUrl');
      return referrerUrl;
    } on PlatformException catch (e) {
      print("Failed to get referrer URL: '${e.message}'.");
      return null;
    }
  }

  static Future<Map<String, dynamic>> getAttributionData() async {
    const channel = MethodChannel('resumeMethodChannel');
    try {
      final Map<dynamic, dynamic>? attributionData = await channel.invokeMethod('getAttributionData');
      if (attributionData != null) {
        return Map<String, dynamic>.from(attributionData);
      } else {
        throw Exception("Failed to retrieve attribution data.");
      }
    } catch (e) {
      throw Exception("Failed to retrieve attribution data: $e");
    }
  }

  static Future<String> getDeviceUUIDiOS() async {
    const channel = MethodChannel('resumeMethodChannel');
    try {
      final String deviceUUID = await channel.invokeMethod('getDeviceUUID');
      return deviceUUID;
    } on PlatformException catch (e) {
      return "Failed to get device UUID: '${e.message}'.";
    }
  }

  static Future<String> getDeviceUUIDAndroid() async {
    const channel = MethodChannel('resumeMethodChannel');
    try {
      final String deviceUUID = await channel.invokeMethod('getDeviceUUID');
      return deviceUUID;
    } on PlatformException catch (e) {
      return "Failed to get device UUID: '${e.message}'.";
    }
  }
}
