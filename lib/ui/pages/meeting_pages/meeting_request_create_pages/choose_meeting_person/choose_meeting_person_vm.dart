import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';


class ChooseMeetingPersonViewModel extends ViewModel {
  ChooseMeetingPersonViewModel(this.context){
    _getInit();
  }
  final BuildContext context;

  String choosedPartnerID = '';
  void onPartnerChoosed(String newValue){
    choosedPartnerID = newValue;
    notifyListeners();
  }

  void onTap(){
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    userNotifier.meetingDraft.partnerID = choosedPartnerID;
    print('onTap - ${userNotifier.meetingDraft.partnerID}');
    context.router.push(const InputDescriptionMeetingViewRoute());
  }

  void _getInit(){
    // final userData = Provider.of<UserNotifier>(context).userData;
    // goalsGroupValue = userData.meetingsGoal;
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    print('_getInit - ${userNotifier.meetingDraft.partnerID}');
    choosedPartnerID = userNotifier.meetingDraft.partnerID;
    // notifyListeners();
  }

}