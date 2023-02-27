import 'package:flutter/material.dart';

class Utils {
  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static List<HobbyModel> containFilterFuncTest({
    required List<HobbyModel> queryList,
    required String searchValue,
  }) =>
      queryList.where((HobbyModel element) {
        return element.title.toLowerCase().contains(searchValue.toLowerCase());
      }).toList();

  static List<HobbyModel> onSearchChanged(String? value,
      List<HobbyModel> displayedList, List<HobbyModel> currentList) {
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
      int neededIndex, List<HobbyModel> currentList, List<String> resultList) {
    final wasActive = currentList[neededIndex].active;
    currentList[neededIndex].active = !wasActive;

    final title = currentList[neededIndex].title;

    if (wasActive) {
      resultList.remove(title);
    } else {
      resultList.add(title);
    }

    final resultMap = {
      'currentList': currentList,
      'resultList': resultList,
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
