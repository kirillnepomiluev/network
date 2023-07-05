import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/utils/res.dart';
import 'package:provider/provider.dart';

class HomeProfileTop extends StatelessWidget {
  const HomeProfileTop({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserNotifier>(context).userData;
    final mediaTop = MediaQuery.of(context).viewPadding.top + 10;

    return Padding(
      padding: EdgeInsets.only(
        top: mediaTop,
        left: Res.s15,
        right: Res.s15,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                context.router.push(const AvatarEditViewRoute());
              },
              child: PartnerAvatarRow(
                userModel: userData,
                partnerLevel: userData.level,
                yourLevel: userData.level,
                showYourLevel: false,
                contSize: Res.s60,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.router.push(const SettingsMainViewRoute());
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            iconSize: Res.s26,
          ),
        ],
      ),
    );
  }
}
