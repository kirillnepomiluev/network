import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils_meetings.dart';
import 'package:provider/provider.dart';


class ChooseMeetingPersonViewModel extends ViewModel {
  ChooseMeetingPersonViewModel(this.context){
    _getInit();
  }
  final BuildContext context;

  UserModel choosedPartnerModel = UserModel.emptyModel();
  String choosedPartnerID = '';
  void onPartnerChoosed(UserModel newPartnerModel){
    choosedPartnerID = newPartnerModel.id!;
    choosedPartnerModel = newPartnerModel;
    UtilsMeeting.onChosePartner(context, choosedPartnerModel);
    notifyListeners();
  }

  // void onTap(){
  //   // final userNotifier = Provider.of<UserNotifier>(context, listen: false);
  //   // userNotifier.meetingDraft.partnerID = choosedPartnerID;
  //   // print('onTap - ${userNotifier.meetingDraft.partnerID}');
  //   // context.router.push(const InputDescriptionMeetingViewRoute());
  // }

  void _getInit(){
    // final userData = Provider.of<UserNotifier>(context).userData;
    // goalsGroupValue = userData.meetingsGoal;
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    print('_getInit - ${userNotifier.meetingDraft.partnerID}');
    choosedPartnerID = userNotifier.meetingDraft.partnerID;
    // notifyListeners();
  }

}