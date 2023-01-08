import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/invitation_tab.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class ChooseInvitationScreen extends StatelessWidget {
  final ActiveInvitationTabs activeTab;
  final Function(ActiveInvitationTabs) changeTab;
  const ChooseInvitationScreen({
    Key? key, required this.activeTab, required this.changeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InvitationTab(
          text: AppString.of(context).invitations,
          activeTab: activeTab,
          changeTab: changeTab,
          tabName: ActiveInvitationTabs.invitations,
        ),
        InvitationTab(
          text: AppString.of(context).partners,
          activeTab: activeTab,
          changeTab: changeTab,
          tabName: ActiveInvitationTabs.partners,
        ),
      ],
    );
  }
}
