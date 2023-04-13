import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';


class ProfileBottomSheetViewModel extends ViewModel {
  ProfileBottomSheetViewModel(this.context){
    _getInit();
  }
  final BuildContext context;

  void onStatusTap(){
    context.router.push(
      EditFieldViewRoute(
        text1: '${AppString.of(context).inputOwn} ',
        text2: AppString.of(context).status,
        description: AppString.of(context)
            .statusWillShowenInYourProfile,
        keyName: 'status',
      ),
    );
  }

  void onAboutTap(){
    context.router.push(
      EditFieldViewRoute(
        text1: '${AppString.of(context).tell} ',
        text2: AppString.of(context).aboutYou,
        description: AppString.of(context).thisInfoWillBeShowedInProfile,
        keyName: 'about',
      ),
    );
  }

  void onAddInterest(){
    context.router.push(
      ChooseCategoriesViewRoute(isAuth: false, keyName: 'interests'),
    );
  }

  void onAddOccupation(){
    context.router.push(
      ChooseCategoriesViewRoute(isAuth: false, keyName: 'occupation'),
    );
  }

  bool hideSex = false;
  void onHideSexCheckBox(bool? newValue){
    hideSex = newValue!;
    notifyListeners();
    UserNotifier().updateData(newData: {
      'hide_sex': hideSex
    },);
  }

  bool hideAge = false;
  void onHideAgeCheckBox(bool? newValue){
    hideAge = newValue!;
    notifyListeners();
    UserNotifier().updateData(newData: {
      'hide_age': hideAge
    },);
  }

  final List<String> sexListOptions = ['Мужчина', 'Женщина'];
  String sexGroupValue = '';
  void onSexRadioChoose(String? newValue){
    sexGroupValue = newValue!;
    notifyListeners();
    UserNotifier().updateData(newData: {
      'sex': sexGroupValue
    },);
  }


  final List<String> familyStatusListOptions = ['Свободен', 'Женат', 'В поиске'];
  String familyStatusGroupValue = '';
  void onFamilyStatusRadioChoose(String? newValue){
    familyStatusGroupValue = newValue!;
    notifyListeners();

    UserNotifier().updateData(newData: {
      'family_status': familyStatusGroupValue
    },);
  }

  bool hideFamilyStatus = false;
  void onHideFamilyStatusCheckBox(bool? newValue){
    hideFamilyStatus = newValue!;
    notifyListeners();
    UserNotifier().updateData(newData: {
      'hide_family_status': hideFamilyStatus
    },);
  }


  final List<String> goalsListOptions = ['Общение', 'Деловая', 'Свидание'];
  String goalsGroupValue = '';
  void onGoalsRadioChoose(String? newValue){
    goalsGroupValue = newValue!;
    notifyListeners();

    UserNotifier().updateData(newData: {
      'meetings_goal': goalsGroupValue
    },);
  }

  bool hideMeetingsGoal = false;
  void onHideMeetingsGoalCheckBox(bool? newValue){
    hideMeetingsGoal = newValue!;
    notifyListeners();
    UserNotifier().updateData(newData: {
      'hide_meetings_goal': hideMeetingsGoal
    },);
  }

  void _getInit(){
    final userData = Provider.of<UserNotifier>(context).userData;
    hideSex = userData.hideSex;
    hideAge = userData.hideAge;
    hideFamilyStatus = userData.hideFamilyStatus;
    sexGroupValue =  userData.sex;
    goalsGroupValue = userData.meetingsGoal;
    familyStatusGroupValue = userData.familyStatus;
    notifyListeners();
  }

  void onAgeTap(){
    context.router.push(
      ChooseBirthDateViewRoute(isAuth: false),
    );
  }

  void onBuyTokens(){
    // context.router.pop();
    context.router.push(HomeViewRoute(initIndex: 3));
  }

}