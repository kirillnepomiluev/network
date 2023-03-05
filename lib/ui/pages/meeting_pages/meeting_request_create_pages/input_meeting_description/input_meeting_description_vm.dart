import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/utils.dart';
import 'package:provider/provider.dart';

class InputDescriptionMeetingViewModel extends ViewModel {
  InputDescriptionMeetingViewModel(this.context) {
    _getInit();
  }
  final BuildContext context;

  final textController = TextEditingController(text: '');

  void onTap() {
    Utils.unFocus();
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    userNotifier.meetingDraft.description = textController.text;
    // context.router.push(const ChooseMeetingOccupationsViewRoute());
    context.router.push(ChooseCategoriesViewRoute(isAuth: false, isMeeting: true, keyName: 'occupation'));
  }

  void _getInit() {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    textController.text = userNotifier.meetingDraft.description;
  }
}
