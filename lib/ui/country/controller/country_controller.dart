import 'package:get/get.dart';
import 'package:vpn_basic_project/repository/repository.dart';

import '../../../utils/constant.dart';

class CountryController extends GetxController {
  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    Constant.vpnList.clear();
    Constant.vpnList = await Repo.getVPNServers();
    for (int a = 0; a < Constant.vpnList.length; a++) {
      var emptySession = Constant.vpnList[a].numVpnSessions;
      if (emptySession == 0) {
        Constant.vpnList.removeAt(a);
      }
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    for (int a = 0; a < Constant.vpnList.length; a++) {
      var emptySession = Constant.vpnList[a].numVpnSessions;
      if (emptySession == 0) {
        Constant.vpnList.removeAt(a);
      }
    }
    super.onInit();
  }
}
