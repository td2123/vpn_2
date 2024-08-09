import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vpn_basic_project/utils/debugs.dart';
import '../../../ad/ads.dart';
import '../../../ad/native_ad_controller.dart';
import '../../../models/ip_details.dart';
import '../../../models/network_data.dart';
import '../../../repository/repository.dart';
import '../../../utils/color.dart';
import '../../../utils/font.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _adController = NativeAdController();

  @override
  void initState() {
    if(Debug.isShowAd  && Debug.isShowBanner&& Debug.isShowBannerInfo) {
      _adController.ad = Ads.loadNativeAd(adController: _adController);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ipData = IPDetails.fromJson({}).obs;
    Repo.getIPDetails(ipData: ipData);
    return Obx(
          () => Scaffold(
        backgroundColor: CColor.white12,
        bottomNavigationBar: _adController.ad != null &&
                _adController.adLoaded.isTrue &&
                Debug.isShowAd &&
                Debug.isShowBanner &&
                Debug.isShowBannerInfo
            ? SafeArea(
                child:
                    SizedBox(height: 85, child: AdWidget(ad: _adController.ad!)))
            : null,
        appBar: AppBar(
          backgroundColor: CColor.white12,
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: CColor.white12,
              systemNavigationBarColor: CColor.white12,
              systemNavigationBarIconBrightness: Brightness.dark),
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.black, size: 25),
          ),
          actions: [
            InkWell(
              splashColor: CColor.transparent,
              highlightColor: CColor.transparent,
              onTap: () {
                ipData.value = IPDetails.fromJson({});
                Repo.getIPDetails(ipData: ipData);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10
                ),
                child: Icon(CupertinoIcons.refresh, color: Colors.black, size: 25),
              ),
            ),
          ],
          title: Text('Network Test Screen',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: Font.nunito,
                  color: CColor.black,
                  fontWeight: FontWeight.w500)),
        ),
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 10, right: 10),
        //   child: FloatingActionButton(
        //       onPressed: () {
        //         ipData.value = IPDetails.fromJson({});
        //         Repo.getIPDetails(ipData: ipData);
        //       },
        //       backgroundColor: Colors.blue,
        //       child: Icon(CupertinoIcons.refresh, color: Colors.white)),
        // ),
        body:  ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(15),
              children: [
                _item(
                  NetworkData(
                    title: 'IP Address',
                    subtitle: ipData.value.query,
                    icon: Icon(CupertinoIcons.location_solid,
                        color: Colors.blue),
                  ),
                ),
                _item(
                  NetworkData(
                    title: 'Internet Provider',
                    subtitle: ipData.value.isp,
                    icon: Icon(Icons.business, color: Colors.orange),
                  ),
                ),
                _item(
                  NetworkData(
                    title: 'Location',
                    subtitle: ipData.value.country.isEmpty
                        ? 'Fetching ...'
                        : '${ipData.value.city}, ${ipData.value.regionName}, ${ipData.value.country}',
                    icon: Icon(CupertinoIcons.location, color: Colors.pink),
                  ),
                ),
                _item(
                  NetworkData(
                    title: 'Pin-code',
                    subtitle: ipData.value.zip,
                    icon: Icon(CupertinoIcons.location_solid,
                        color: Colors.cyan),
                  ),
                ),
                _item(
                  NetworkData(
                    title: 'Timezone',
                    subtitle: ipData.value.timezone,
                    icon: Icon(CupertinoIcons.time, color: Colors.green),
                  ),
                ),
              ]),
      ),
    );
  }

  _item(NetworkData networkData) {
    return Card(
        elevation: 5,
        color: CColor.white,
        margin: EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(15),
          child: ListTile(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            leading: Icon(networkData.icon.icon,
                color: networkData.icon.color,
                size: networkData.icon.size ?? 28),
            title: Text(networkData.title,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: Font.nunito,
                    color: CColor.black,
                    fontWeight: FontWeight.w500)),
            subtitle: Text(networkData.subtitle,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: Font.nunito,
                    color: CColor.black,
                    fontWeight: FontWeight.w500)),
          ),
        ));
  }
}
