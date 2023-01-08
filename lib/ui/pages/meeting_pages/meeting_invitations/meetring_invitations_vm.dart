import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';

class MeetingInvitationsViewModel extends ViewModel {
  final BuildContext context;
  MeetingInvitationsViewModel(this.context);

  ActiveInvitationTabs activeTab = ActiveInvitationTabs.values.first;

  void changeTab(ActiveInvitationTabs tabName) {
    activeTab = tabName;
    notifyListeners();
  }

}