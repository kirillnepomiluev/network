import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class ChooseCategoriesViewModel extends ViewModel {
  ChooseCategoriesViewModel(
    this.context,
    this.isAuth,
    this.keyName,
    this.isMeeting,
  ) {
    getInit();
  }
  final BuildContext context;
  final bool isAuth;
  final String keyName;
  final bool isMeeting;

  bool isOccupation = false;

  void getInit() {
    List initialList = [];

    if (!isAuth) {
      final userNotifier = Provider.of<UserNotifier>(context, listen: false);
      final userData = userNotifier.userData;
      initialList = userData.dataMap[keyName];

      if (isMeeting) {
        if (keyName == 'interests') {
          initialList = userNotifier.meetingDraft.interests;
        } else {
          isOccupation = true;
          initialList = userNotifier.meetingDraft.occupation;
        }
      }
    }

    final optionsList = isOccupation? AppConstants.occupationsList : AppConstants.hobbiesList;

    for (int i = 0; i < optionsList.length; i++) {
      bool active = false;
      final item = optionsList[i];

      if (!isAuth && initialList.contains(item)) {
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
    final resultMap =
        Utils.onSelectContainer(neededIndex, currentList, resultList);
    currentList = resultMap['currentList'];
    notifyListeners();
  }

  void onNextPage() {
    Utils.unFocus();
    if (isMeeting) {
      if (keyName == 'interests') {
        context.router.push(const ChooseMeetingDateViewRoute());
      } else {
        context.router.push(ChooseCategoriesViewRoute(isAuth: isAuth, keyName: 'interests', isMeeting: isMeeting));
      }
      return;
    }
    if (isAuth) {
      if (keyName == 'interests') {
        context.router.push(
          ChooseCategoriesViewRoute(
            isAuth: isAuth,
            keyName: 'occupation',
          ),
        );
      } else {
        context.router.push(const InputAboutYouViewRoute());
      }
    } else {
      context.router.pop();
    }

    // context.router.push(ChooseOccupationViewRoute(isAuth: isAuth));
  }

  void writeData() {
    for (final item in currentList) {
      if (item.active) {
        resultList.add(item.title);
      }
    }

    print('resultList $resultList');
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    if (isMeeting) {
      if (keyName == 'interests') {
        userNotifier.meetingDraft.interests = resultList;
      } else {
        userNotifier.meetingDraft.occupation = resultList;
      }
    } else {
      userNotifier.updateData(
        newData: {keyName: resultList},
      );
    }
  }

  void onContinue() {
    writeData();
    onNextPage();
  }

  // void onAddInterests() {
  //   writeData();
  //   context.router.pop();
  // }
}
