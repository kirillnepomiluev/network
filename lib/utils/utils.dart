// ignore_for_file: parameter_assignments
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/credentials/supabase_credentials.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

import '../app/router/app_router.gr.dart';

class Utils {
  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static DateTime? getDate(String strDate){
    return DateTime.tryParse(strDate);
  }

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
    String level = '';
    final data = await AppSupabase.client
        .from(AppSupabase.strUsers)
        .select()
        .eq('id', AppSupabase.client.auth.currentUser!.id);

    level = data[0]['level']??'';

    if(level.isEmpty){
      context.router.push(const RegSuccessViewRoute());
    }
    else{
      context.router.push(HomeViewRoute(),);
    }
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
}

class HobbyModel {
  HobbyModel(this.title, this.index, {this.active = false});
  bool active = false;
  final int index;
  final String title;
}
