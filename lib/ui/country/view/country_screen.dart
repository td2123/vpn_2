import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/models/vpn.dart';
import 'package:vpn_basic_project/ui/country/controller/country_controller.dart';

import '../../../utils/preference.dart';
import '../../../vpn_service/vpn_service_engine.dart';
import '../../home/controller/home_controller.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

final _controller = Get.put(CountryController());
final homeController = Get.find<HomeController>();

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    if (_controller.vpnList.isEmpty) _controller.getVpnData();

    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text('VPN Locations (${_controller.vpnList.length})'),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: FloatingActionButton(
                onPressed: () => _controller.getVpnData(),
                child: Icon(CupertinoIcons.refresh)),
          ),
          body: _controller.isLoading.value
              ? _loadingWidget(_controller)
              : _controller.vpnList.isEmpty
                  ? _noVPNFound(_controller)
                  : _vpnData(_controller)),
    );
  }

  _vpnData(CountryController logic) {
    return ListView.builder(
      itemCount: logic.vpnList.length,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          top: Get.height * .015,
          bottom: Get.height * .1,
          left: Get.width * .04,
          right: Get.width * .04),
      itemBuilder: (ctx, i) => _item(
        logic.vpnList[i],
      ),
    );
  }

  _item(Vpn vpnItem) {
    return Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: Get.height * .01),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {
            homeController.vpn.value = vpnItem;
            Pref.vpn = vpnItem;
            Get.back();
            if (homeController.vpnState.value == VpnEngine.vpnConnected) {
              VpnEngine.stopVpn();
              Future.delayed(
                  Duration(seconds: 2), () => homeController.connectToVpn());
            } else {
              homeController.connectToVpn();
            }
          },
          borderRadius: BorderRadius.circular(15),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: Container(
              padding: EdgeInsets.all(.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: BorderRadius.circular(5)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                    'assets/flags/${vpnItem.countryShort.toLowerCase()}.png',
                    height: 40,
                    width: Get.width * .15,
                    fit: BoxFit.cover),
              ),
            ),
            title: Text(vpnItem.countryLong),
            subtitle: Row(
              children: [
                Icon(Icons.speed_rounded, color: Colors.blue, size: 20),
                SizedBox(width: 4),
                Text(_formatBytes(vpnItem.speed, 1),
                    style: TextStyle(fontSize: 13))
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(vpnItem.numVpnSessions.toString(),
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(width: 4),
                Icon(CupertinoIcons.person_3, color: Colors.blue),
              ],
            ),
          ),
        ));
  }

  String _formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ['Bps', "Kbps", "Mbps", "Gbps", "Tbps"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  _loadingWidget(CountryController logic) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/lottie/loading.json',
              width: Get.width * .7),
          Text(
            'Loading VPNs... 😌',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _noVPNFound(CountryController logic) {
    return Center(
      child: Text(
        'VPNs Not Found! 😔',
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }
}
