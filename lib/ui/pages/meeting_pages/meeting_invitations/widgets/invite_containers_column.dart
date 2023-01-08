import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class InviteContainersColumn extends StatelessWidget {
  final ActiveInvitationTabs activeTab;
  const InviteContainersColumn({
    Key? key, required this.activeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ViewInviteContainer(
            strName: 'Джоли 28',
            imageUrl: Assets.images.avatars.avatar0.keyName, //0
            activeTab: activeTab,
            showVerified: true),
        ViewInviteContainer(
            strName: 'Игорь, 34',
            imageUrl: Assets.images.avatars.avatar1.keyName, //1
            activeTab: activeTab,
            showVerified: false),
        ViewInviteContainer(
            strName: 'Джоли 28',
            imageUrl: Assets.images.avatars.avatar0.keyName, //0
            activeTab: activeTab,
            showVerified: true),
      ],
    );
  }
}
