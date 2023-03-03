import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ChooseCategoriesViewModel extends ViewModel {
  ChooseCategoriesViewModel(this.context, this.isAuth, this.keyName) {
    getInit();
  }
  final BuildContext context;
  final bool isAuth;
  final String keyName;

  void getInit(){
    List initialList = [];
    if(!isAuth){
      final userData = Provider.of<UserNotifier>(context).userData;
      initialList = userData.mapData[keyName];
    }

    const optionsList = Constants.hobbiesList;

    for (int i = 0; i < optionsList.length; i++) {
      bool active = false;
      final item = optionsList[i];

      if(!isAuth && initialList.contains(item)){
        active = true;
      }

      currentList.add(HobbyModel(item, i, active: active));
    }

    displayedList = currentList;
  }

  void unFocus() {
    Utils.unFocus();
  }

  List<HobbyModel> currentList = [];
  List<HobbyModel> displayedList = [];
  List<String> resultList = [];

  final textController = TextEditingController(text: '');

  void onSearchChanged(String? value) {
    displayedList = Utils.onSearchChanged(value, displayedList, currentList);
    notifyListeners();
  }

  void onSelectContainer(int neededIndex) {
    final resultMap = Utils.onSelectContainer(neededIndex, currentList,  resultList);
    currentList = resultMap['currentList'];
    notifyListeners();
  }

  void onNextPage() {
    Utils.unFocus();
    context.router.push(ChooseOccupationViewRoute(isAuth: true));
  }

  void writeData() {
    for(final item in currentList){
      if(item.active){
        resultList.add(item.title);
      }
    }

    print('resultList $resultList');

    if(resultList.isNotEmpty){
      UserNotifier().updateData(
        newData: {keyName: resultList},
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
