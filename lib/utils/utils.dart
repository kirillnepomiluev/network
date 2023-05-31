// ignore_for_file: parameter_assignments
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class Utils {

  static String getLevel(int level) => level<1? 'Нет костюма' : 'Уровень $level';


  static String getEnv(String title) => dotenv.env[title]!;

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static DateTime? getDate(String strDate){
    return DateTime.tryParse(strDate);
  }

  // static DateTime? getFormatedDate(DateTime date){
  //   return DateTime.tryParse(strDate);
  // }

  static String getProductType(StoreProductType productType) {
    String strType = '';
    if(productType==StoreProductType.head){
      strType = 'head';
    }
    else if(productType==StoreProductType.body){
      strType = 'body';
    }
    return strType;
  }


  static Future<void> checkReg(BuildContext context) async {

    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    await userNotifier.firstUpdateData();
    // await userNotifier.setUserDataFunc();

    final userData = userNotifier.userData;
    final name = userData.name;
    print('name $name');
    if(name.isEmpty){
      context.router.push(const RegSuccessViewRoute());
    }
    else{
      context.router.push(HomeViewRoute(),);
    }

    // String level = '';
    // final data = await AppSupabase.client
    //     .from(AppSupabase.strUsers)
    //     .select()
    //     .eq('id', AppSupabase.client.auth.currentUser!.id);
    //
    // level = data[0]['rank']??'';
    //



  }


  static List<HobbyModel> containFilterFuncTest({
    required List<HobbyModel> queryList,
    required String searchValue,
  }) =>
      queryList.where((HobbyModel element) {
        return element.title.toLowerCase().contains(searchValue.toLowerCase());
      }).toList();

  static List<HobbyModel> onSearchChanged(String? value,
      List<HobbyModel> displayedList, List<HobbyModel> currentList,) {
    final newValue = value!;

    if (newValue.isEmpty) {
      displayedList = currentList;
    } else {
      displayedList = Utils.containFilterFuncTest(
        queryList: currentList,
        searchValue: newValue,
      );
    }

    return displayedList;
  }

  static Map<String, dynamic> onSelectContainer(
      int neededIndex, List<HobbyModel> currentList, List<String> resultList,) {
    final wasActive = currentList[neededIndex].active;
    currentList[neededIndex].active = !wasActive;

    // final title = currentList[neededIndex].title;

    // if (wasActive) {
    //   resultList.remove(title);
    // } else {
    //   resultList.add(title);
    // }

    final resultMap = {
      'currentList': currentList,
      // 'resultList': resultList,
    };

    return resultMap;
  }



  Future<void> getDeviceInfo() async {
    // setNetwork();

    // final deviceInfoPlugin = DeviceInfoPlugin();
    // final deviceInfo = await deviceInfoPlugin.deviceInfo;
    // final allInfo = deviceInfo.data;

    // print('allInfo $allInfo');
  }




  Future<void> setNetwork() async {
    final info = NetworkInfo();

    var locationStatus = await Permission.location.status;

    if (locationStatus.isDenied) {
      await Permission.locationWhenInUse.request();
    }
    if (await Permission.location.isRestricted) {
      openAppSettings();
    }

    if (await Permission.location.isGranted) {
      final wifiName = await info.getWifiName(); // "FooNetwork"
      final wifiBSSID = await info.getWifiBSSID(); // 11:22:33:44:55:66
      final wifiIP = await info.getWifiIP(); // 192.168.1.43
      final wifiIPv6 =
      await info.getWifiIPv6(); // 2001:0db8:85a3:0000:0000:8a2e:0370:7334
      final wifiSubmask = await info.getWifiSubmask(); // 255.255.255.0
      final wifiBroadcast = await info.getWifiBroadcast(); // 192.168.1.255
      final wifiGateway = await info.getWifiGatewayIP(); // 192.168.1.1
      print(
          'wifiName $wifiName $wifiBSSID $wifiIP $wifiIPv6 $wifiSubmask $wifiBroadcast $wifiGateway');
    }

    //    final info = NetworkInfo();
    //
  }


}




class HobbyModel {
  HobbyModel(this.title, this.index, {this.active = false});
  bool active = false;
  final int index;
  final String title;
}
