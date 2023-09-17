import 'package:auto_route/auto_route.dart';
import 'package:network_app/app/core/models/user_model.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/dialogs/dialog_with_button.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';


class _NeedCostumeDialog extends StatelessWidget {
  const _NeedCostumeDialog({
    Key? key, required this.level,
  }) : super(key: key);
  final int level;


  @override
  Widget build(BuildContext context) {
    return
      AppDialogWithButton(title: 'You need a matching suit', subTitle: 'Level $level', buttonText: 'Visit Store', buttonFunc: (){
                  context.router.pop();
                  context.router.push(HomeViewRoute(initIndex: 3));
      });
  }
}

class UtilsMeeting {

  static int culcTokens(UserModel partnerModel) {
    return partnerModel.level*100;
  }

    static void onMeetingTap(BuildContext context, UserModel partnerModel) {
    final userData = Provider.of<UserNotifier>(context, listen: false).userData;
    final myLevel = userData.level;
    final partnerLevel = partnerModel.level;

    print('myLevel $myLevel partnerLevel $partnerLevel');

    if (myLevel < partnerLevel) {
      // return showSimpleDialog(
      //     title: 'Недоступно', text: 'Купите костюм', context: context);

      showDialog<void>(
        context: context,
        builder: (BuildContext context) => _NeedCostumeDialog(
          level: partnerLevel,
        ),
      );
      return;
    }

    // context.router.push(MeetingTimerViewRoute());
    context.router.push(ChooseMeetingTypeViewRoute(partnerModel: partnerModel));
  }


  static void onChosePartner(BuildContext context, UserModel partnerModel){
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    userNotifier.meetingDraft.partnerID = partnerModel.id!;
    userNotifier.meetingDraft.partnerModel = partnerModel;
    // userNotifier.meetingDraft.partnerLevel = partnerModel.level;
    // print('onTap - ${userNotifier.meetingDraft.partnerID}');
    context.router.push(const InputDescriptionMeetingViewRoute());
  }

}
