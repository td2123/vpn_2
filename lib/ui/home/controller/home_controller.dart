import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../ad/ad_helper/ad_helper.dart';
import '../../../ad_loader/ad_loader_mediation.dart';
import '../../../models/vpn.dart';
import '../../../models/vpn_config.dart';
import '../../../utils/debugs.dart';
import '../../../utils/preference.dart';
import '../../../utils/utils.dart';
import '../../../vpn_service/vpn_service_engine.dart';

class HomeController extends GetxController {
  final Rx<Vpn> vpn = Pref.vpn.obs;
  String appVersion = "";
  String appPackageName = "";

  final vpnState = VpnEngine.vpnDisconnected.obs;

  void connectToVpn() async {
    if (vpn.value.openVPNConfigDataBase64.isEmpty) {
      Get.closeAllSnackbars();
      Get.snackbar(
          'Info', 'Select a Location by clicking \'Select Country Server\'',
          colorText: Colors.black,
          barBlur: 15,
          backgroundColor: Colors.black12);
      return;
    }

      if (Debug.isShowAd && Debug.isShowInter && Debug.isInterConnectVPN) {
        if (Debug.isPreloading) {
          AdLoaderMediation.interMediation(() async {
            if (vpnState.value == VpnEngine.vpnDisconnected) {
              final data = const Base64Decoder()
                  .convert(vpn.value.openVPNConfigDataBase64);
              final config = const Utf8Decoder().convert(data);
              final vpnConfig = VpnConfig(
                  country: vpn.value.countryLong,
                  username: 'vpn',
                  password: 'vpn',
                  config: config);

              await VpnEngine.startVpn(vpnConfig);
            }else {
              await VpnEngine.stopVpn();
            }
          });
        } else {
          _loadInter(() async {
            if (vpnState.value == VpnEngine.vpnDisconnected) {
              final data = const Base64Decoder()
                  .convert(vpn.value.openVPNConfigDataBase64);
              final config = const Utf8Decoder().convert(data);
              final vpnConfig = VpnConfig(
                  country: vpn.value.countryLong,
                  username: 'vpn',
                  password: 'vpn',
                  config: config);

              await VpnEngine.startVpn(vpnConfig);
            }else {
              await VpnEngine.stopVpn();
            }
          });
        }
      } else {
        if (vpnState.value == VpnEngine.vpnDisconnected) {
        final data =
            const Base64Decoder().convert(vpn.value.openVPNConfigDataBase64);
        final config = const Utf8Decoder().convert(data);
        final vpnConfig = VpnConfig(
            country: vpn.value.countryLong,
            username: 'vpn',
            password: 'vpn',
            config: config);

        await VpnEngine.startVpn(vpnConfig);
        }else {
          await VpnEngine.stopVpn();
        }
      }
    update();
  }

  Color get getButtonColor {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return Colors.blue;

      case VpnEngine.vpnConnected:
        return Colors.green;

      default:
        return Colors.orangeAccent;
    }
  }

  String get getButtonText {
    switch (vpnState.value) {
      case VpnEngine.vpnDisconnected:
        return 'Tap to Connect';

      case VpnEngine.vpnConnected:
        return 'Disconnect';

      default:
        return 'Connecting...';
    }
  }

  @override
  void onInit() {
    getDeviceInfo();
    super.onInit();
  }

  getDeviceInfo() async {
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) async {
      // String appName = packageInfo.appName;
      String packageName = packageInfo.packageName;
      String version = packageInfo.version;
      // String buildNumber = packageInfo.buildNumber;
      appVersion = version;
      appPackageName = packageName;
      update();
    });
  }

  _loadInter(Function onDismissed) {
    try {
      Utils.showLoader(Get.context!);
    } catch (e) {
      Debug.printLog(e.toString());
      Get.back();
    }
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) async {
          await Future.delayed(Duration(milliseconds: 500));
          Get.back();
          ad.show();
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              onDismissed.call();
            },
          );
        },
        onAdFailedToLoad: (err) {
          Debug.printLog(":::::::::: google ad fail :::::::::: $err");
        },
      ),
    );
  }
}
