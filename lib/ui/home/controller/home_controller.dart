import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/vpn.dart';
import '../../../models/vpn_config.dart';
import '../../../utils/preference.dart';
import '../../../vpn_service/vpn_service_engine.dart';

class HomeController extends GetxController {
  final Rx<Vpn> vpn = Pref.vpn.obs;

  final vpnState = VpnEngine.vpnDisconnected.obs;

  void connectToVpn() async {
    if (vpn.value.openVPNConfigDataBase64.isEmpty) {
      return;
    }

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
    } else {
      await VpnEngine.stopVpn();
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
}
