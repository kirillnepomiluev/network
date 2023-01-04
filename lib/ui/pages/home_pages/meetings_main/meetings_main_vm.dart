import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/creqte_request_pages/search_page.dart';
import 'package:network_app/ui/pages/meeting_pages/invitations/invitations_page.dart';
import 'package:network_app/ui/pages/meeting_pages/notifications/notifications_page.dart';
import 'package:network_app/ui/pages/profile_pages/partner/view_partner_profile_page.dart';
import 'package:network_app/ui/widgets/view_model_data/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class MeetingsMainViewModel extends ViewModel {
  final BuildContext context;

  MeetingsMainViewModel(this.context);

  ActiveMeetingTab activeTab = ActiveMeetingTab.forYou;

  void changeTab(ActiveMeetingTab tabName) {
    activeTab = tabName;
    notifyListeners();
  }

  void onSearchIconTap(){
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const SearchPage()));
  }

    void onNotificationIconTap(){
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const NotificationsPage()));
  }

    void onTimerIconTap(){
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) => const InvitationsPage()));
  }

  void onPartnerTap() {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (context) =>
        const ViewPartnerProfilePage()));
  }

}