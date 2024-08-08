import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:lottie/lottie.dart';
import 'package:vpn_basic_project/ad/ads.dart';
import 'package:vpn_basic_project/models/vpn.dart';
import 'package:vpn_basic_project/ui/country/controller/country_controller.dart';
import 'package:vpn_basic_project/utils/color.dart';
import 'package:vpn_basic_project/utils/font.dart';

import '../../../ad/native_ad_controller.dart';
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
final _adController = NativeAdController();

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    if (_controller.vpnList.isEmpty) _controller.getVpnData();
    _adController.ad = Ads.loadNativeAd(adController: _adController);

    return Obx(
      () => Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar:
              _adController.ad != null && _adController.adLoaded.isTrue
                  ? SafeArea(
                      child: SizedBox(
                          height: 85, child: AdWidget(ad: _adController.ad!)))
                  : null,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            surfaceTintColor: CColor.white,
            systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                statusBarBrightness: Brightness.dark,
                statusBarColor: CColor.white,
                systemNavigationBarIconBrightness: Brightness.dark),
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back, color: Colors.black, size: 25),
            ),
            title: Text('VPN Locations (${_controller.vpnList.length})',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: Font.nunito,
                    color: CColor.black,
                    fontWeight: FontWeight.w500)),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 10, right: 10),
            child: FloatingActionButton(
                onPressed: () => _controller.getVpnData(),
                backgroundColor: Colors.blue,
                child: Icon(CupertinoIcons.refresh, color: Colors.white)),
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
        color: CColor.white12,
        margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
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
            title: Text(vpnItem.countryLong,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: Font.nunito,
                    color: CColor.black,
                    fontWeight: FontWeight.w500)),
            subtitle: Row(
              children: [
                Icon(Icons.speed_rounded, color: Colors.blue, size: 20),
                SizedBox(width: 4),
                Text(_formatBytes(vpnItem.speed, 1),
                    style: TextStyle(
                        fontSize: 13,
                        fontFamily: Font.nunito,
                        color: CColor.txtColor666))
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
              width: Get.width * 0.7),
          Text(
            'Loading VPNs...',
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
        'VPNs Not Found!',
        style: TextStyle(
            fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
      ),
    );
  }
}
