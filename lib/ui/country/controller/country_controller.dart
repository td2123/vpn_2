import 'package:get/get.dart';
import 'package:vpn_basic_project/repository/repository.dart';

import '../../../models/vpn.dart';
import '../../../utils/preference.dart';

class CountryController extends GetxController{
  List<Vpn> vpnList = Pref.vpnList;

  final RxBool isLoading = false.obs;

  Future<void> getVpnData() async {
    isLoading.value = true;
    vpnList.clear();
    vpnList = await Repo.getVPNServers();
    isLoading.value = false;
  }
}