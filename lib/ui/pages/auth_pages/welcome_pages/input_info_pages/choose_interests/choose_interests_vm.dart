import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ChooseInterestsViewModel extends ViewModel {
  ChooseInterestsViewModel(this.context, this.isAuth) {
    getInit();
  }
  final BuildContext context;
  final bool isAuth;

  void getInit(){
    List interestsList = [];
    if(!isAuth){
      final userData = Provider.of<UserNotifier>(context).userData;
      interestsList = userData.interests;
    }

    const optionsList = AppConstants.hobbiesList;

    for (int i = 0; i < optionsList.length; i++) {
      bool active = false;
      final item = optionsList[i];

      if(!isAuth && interestsList.contains(item)){
        active = true;
      }

      hobbiesList.add(HobbyModel(item, i, active: active));
    }

    displayedList = hobbiesList;
  }

  void unFocus() {
    Utils.unFocus();
  }

  List<HobbyModel> hobbiesList = [];
  List<HobbyModel> displayedList = [];
  List<String> resultList = [];

  final textController = TextEditingController(text: '');

  void onSearchChanged(String? value) {
    displayedList = Utils.onSearchChanged(value, displayedList, hobbiesList);
    notifyListeners();
  }

  void onSelectContainer(int neededIndex) {
    final resultMap = Utils.onSelectContainer(neededIndex, hobbiesList,  resultList);
    hobbiesList = resultMap['currentList'];
    notifyListeners();
  }

  void onNextPage() {
    Utils.unFocus();
    context.router.push(ChooseOccupationViewRoute(isAuth: true));
  }

  void writeData() {
    for(final item in hobbiesList){
      if(item.active){
        final title = item.title;
        if(resultList.contains(title)==false){
          resultList.add(title);
        }
      }
    }

    print('resultList $resultList');

    if(resultList.isNotEmpty){
      UserNotifier().updateData(
        newData: {'interests': resultList},
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
