import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';

class ChooseOccupationViewModel extends ViewModel {
  ChooseOccupationViewModel(this.context){
    getInit();
  }
  final BuildContext context;

  void getInit(){
    for (int i = 0; i < AppConstants.hobbiesList.length; i++) {
      final item = AppConstants.hobbiesList[i];
      currentList.add(HobbyModel(item, i));
    }

    displayedList = currentList;
  }

  final int missedCount = 3;

  List<String> choosedOptions = [];

  void onRemove(String item){
    choosedOptions.remove(item);
    notifyListeners();
  }

  void onSelect(String item) {
    if (choosedOptions.length < 3) {
      choosedOptions.add(item);
      notifyListeners();
    }
  }
  ///////////////////////////////////////////////////

  void unFocus() {
    Utils.unFocus();
  }

  List<HobbyModel> currentList = [];
  List<HobbyModel> displayedList = [];
  List<String> resultList = [];

  final textController = TextEditingController(text: '');

  void onSearchChanged(String? value) {
    // final newValue = value!;
    //
    // if (newValue.isEmpty) {
    //   displayedList = currenList;
    // } else {
    //   displayedList = Utils.containFilterFuncTest(
    //     queryList: currenList,
    //     searchValue: newValue,
    //   );
    // }

    displayedList = Utils.onSearchChanged(value, displayedList, currentList);
    notifyListeners();
  }

  void onSelectContainer(int neededIndex) {
    // final wasActive = currenList[neededIndex].active;
    //
    // currenList[neededIndex].active = !wasActive;
    //
    // final title = currenList[neededIndex].title;
    //
    // if (wasActive) {
    //   resultList.remove(title);
    // } else {
    //   resultList.add(title);
    // }
    //int neededIndex, List<HobbyModel> currentList, List<String> resultList
    final resultMap = Utils.onSelectContainer(neededIndex, currentList,  resultList);
    currentList = resultMap['currentList'];
    resultList = resultMap['resultList'];
    notifyListeners();
  }

  void onNextPage() {
    Utils.unFocus();
    context.router.push(const InputAboutYouViewRoute());
  }

  void writeData() {
    if(resultList.isNotEmpty){
      UserNotifier().updateData(
        newData: {'occupation': resultList},
      );
    }
  }

  void onContinue() {
    writeData();
    onNextPage();
  }

  void onAddInterests() {
    writeData();
    context.router.pop();
  }

}