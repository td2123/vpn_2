import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vpn_basic_project/routes/app_routes.dart';
import '../../../models/vpn_status.dart';
import '../../../utils/color.dart';
import '../../../utils/font.dart';
import '../../../vpn_service/vpn_service_engine.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final _controller = Get.put(HomeController());

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    VpnEngine.vpnStageSnapshot().listen((event) {
      _controller.vpnState.value = event;
    });
    return Scaffold(
      backgroundColor: CColor.white12,
      // appBar: _header(),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Column(
          children: [const SizedBox(height: 40), _mapView(logic)],
        );
      }),
    );
  }

  _header() {
    return Container(
      height: 60,
      alignment: Alignment.center,
      width: Get.width,
      child: Text(
        "VPN",
        style: TextStyle(
            color: Colors.black, fontFamily: Font.nunito, fontSize: 20),
      ),
    );
  }

  _mapView(HomeController logic) {
    return Stack(
      children: [
        SvgPicture.asset("assets/map/world-map.svg", color: CColor.viewGray),
        _centerView(logic)
      ],
    );
  }

  _centerView(HomeController logic) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _header(),
        const SizedBox(height: 60),
        Obx(
          () => Align(
            alignment: Alignment.center,
            child: Text(
              logic.vpnState.value == VpnEngine.vpnDisconnected
                  ? "DISCONNECTED"
                  : logic.vpnState.replaceAll('_', ' ').toUpperCase(),
              style: TextStyle(
                  color: CColor.txtColor666,
                  fontFamily: Font.nunito,
                  fontSize: 32),
            ),
          ),
        ),
        _selectServer(logic),
        _downloadAndUploadSpeed(logic),
        SizedBox(height: Get.height * 0.15),
        _vpnButton(logic)
      ],
    );
  }

  _selectServer(HomeController logic) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.country)!.then((v) {
          setState(() {});
        });
      },
      child: Container(
        height: 75,
        margin: const EdgeInsets.all(30),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
            color: CColor.white12.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: CColor.gray, width: 2)),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                  color: CColor.viewGray,
                  borderRadius: BorderRadius.circular(13)),
              child: logic.vpn.value.countryLong.isEmpty
                  ? SvgPicture.asset("assets/icons/language.svg")
                  : Image.asset(
                      'assets/flags/${logic.vpn.value.countryShort.toLowerCase()}.png'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                _controller.vpn.value.countryLong.isEmpty
                    ? "Select Country Server"
                    : _controller.vpn.value.countryLong,
                style: TextStyle(
                    color: CColor.black12,
                    fontFamily: Font.nunito,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            Image.asset("assets/icons/logo.png", height: 30),
          ],
        ),
      ),
    );
  }

  _downloadAndUploadSpeed(HomeController logic) {
    return StreamBuilder<VpnStatus?>(
        initialData: VpnStatus(),
        stream: VpnEngine.vpnStatusSnapshot(),
        builder: (context, snapshot) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset("assets/icons/download.svg"),
                  Column(
                    children: [
                      Text(
                        "DOWNLOAD",
                        style: TextStyle(
                            color: CColor.gray,
                            fontFamily: Font.nunito,
                            fontSize: 13),
                      ),
                      Text(
                        snapshot.data?.byteIn ?? '0.0 kbps',
                        style: TextStyle(
                            color: CColor.gray,
                            fontFamily: Font.nunito,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 35,
                    width: 1,
                    color: CColor.gray,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        "UPLOAD",
                        style: TextStyle(
                            color: CColor.gray,
                            fontFamily: Font.nunito,
                            fontSize: 13),
                      ),
                      Text(
                        snapshot.data?.byteOut ?? '0.0 kbps',
                        style: TextStyle(
                            color: CColor.gray,
                            fontFamily: Font.nunito,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  SvgPicture.asset("assets/icons/upload.svg"),
                ],
              ),
            ));
  }

  _vpnButton(HomeController logic) {
    return Obx(
      () => Semantics(
        button: true,
        child: InkWell(
          onTap: () {
            logic.connectToVpn();
          },
          borderRadius: BorderRadius.circular(100),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: logic.getButtonColor.withOpacity(0.1)),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: logic.getButtonColor.withOpacity(0.3)),
              child: Container(
                width: Get.height * 0.14,
                height: Get.height * 0.14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: logic.getButtonColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.power_settings_new,
                      size: 28,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      logic.getButtonText,
                      style: const TextStyle(
                          fontSize: 12.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
