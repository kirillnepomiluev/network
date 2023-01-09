import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/texts/name_with_verification.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bar_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_invitations/widgets/view_invite_container_bottom.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewInviteContainer extends StatelessWidget {
  final ActiveInvitationTabs activeTab;
  final String strName;
  final String imageUrl;
  final bool showVerified;
  const ViewInviteContainer({
    Key? key,
    required this.activeTab,
    required this.strName,
    required this.imageUrl,
    required this.showVerified,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: AppContainer(
        padH: 21,
        padV: 26,
        radius: AppBorderRadius.r30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewInviteContainerTop(
                activeTab: activeTab, showVerified: showVerified),

            const SizedBox(
              height: 15,
            ),

            NameWithVerification(strName: strName, showVerified: showVerified),

            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${AppString.of(context).level} "${AppString.of(context).base}"',
                ),
                Text('+150 ${AppString.of(context).ofTokens}',
                    style: AppTextStyles.salad),
              ],
            ),

            SizedBox(height: 23.sp), //29

            //Аватар и направление
            ViewInviteContainerBottom(imageUrl: imageUrl)
          ],
        ),
      ),
    );
  }
}
