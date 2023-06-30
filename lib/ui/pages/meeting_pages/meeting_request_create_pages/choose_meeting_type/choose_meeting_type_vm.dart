import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils_meetings.dart';
import 'package:provider/provider.dart';


class ChooseMeetingTypeViewModel extends ViewModel {
  ChooseMeetingTypeViewModel(this.context, this.partnerModel){
    _getInit();
  }
  final BuildContext context;
  final UserModel? partnerModel;


  void onGoalsRadioChoose(String? newValue){
    goalsGroupValue = newValue!;
    notifyListeners();
  }

  void onTap(){
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    userNotifier.meetingDraft.type = goalsGroupValue;
    // userNotifier.meetingDraft.creatorLevel = userNotifier.userData.level;
    // userNotifier.meetingDraft.questionsList = AppConstants.questionsList;

    print('onTap - ${userNotifier.meetingDraft.type}');

    if(partnerModel==null){
      context.router.push(const ChooseMeetingPersonViewRoute());
    }else{
      UtilsMeeting.onChosePartner(context, partnerModel!);
    }

  }

  final List<String> goalsListOptions = [];
  String goalsGroupValue = '';
  void _getInit(){

    goalsListOptions.addAll([AppString.of(context).Chatting, AppString.of(context).business, AppString.of(context).date]);
    
    // final userData = Provider.of<UserNotifier>(context).userData;
    // goalsGroupValue = userData.meetingsGoal;
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);

    final savedType = userNotifier.meetingDraft.type;

    print('_getInit - ${userNotifier.meetingDraft.type}');
    goalsGroupValue = savedType.isEmpty? goalsListOptions.first : savedType;
    // notifyListeners();
  }

}