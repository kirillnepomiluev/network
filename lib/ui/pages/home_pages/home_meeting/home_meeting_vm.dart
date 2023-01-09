import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class MeetingMainViewModel extends ViewModel {
  final BuildContext context;

  MeetingMainViewModel(this.context);

  ActiveMeetingTabs activeTab = ActiveMeetingTabs.values.first;

  void changeTab(ActiveMeetingTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  void onSearchIconTap(){
    context.router.push(MeetingSearchViewRoute());
  }

    void onNotificationIconTap(){
      context.router.push(const MeetingNotificationsViewRoute());
  }

    void onTimerIconTap(){
      context.router.push(const MeetingInvitationsViewRoute());
  }

  void onPartnerTap() {
    context.router.push(const PersonProfileViewRoute());
  }

}