import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class MeetingInvitationsViewModel extends ViewModel {
  MeetingInvitationsViewModel(this.context);
  final BuildContext context;

  ActiveInvitationTabs activeTab = ActiveInvitationTabs.values.first;

  void changeTab(ActiveInvitationTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

}