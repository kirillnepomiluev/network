import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_meeting/widgets/meeting_tab.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class ChooseMeetingScreen extends StatelessWidget {
  final ActiveMeetingTabs activeTab;
  final Function(ActiveMeetingTabs) changeTab;
  const ChooseMeetingScreen({
    Key? key, required this.activeTab, required this.changeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MeetingTab(
          text: AppString.of(context).forYou,
          activeTab: activeTab,
          changeTab: changeTab,
          tabName: ActiveMeetingTabs.forYou,
        ),
        MeetingTab(
          text: AppString.of(context).near,
          activeTab: activeTab,
          changeTab: changeTab,
          tabName: ActiveMeetingTabs.near,
        ),
        Flexible(
          child: AppButton(
              borderRadius: AppBorderRadius.r15,
              textStyle: AppTextStyles.black11.copyWith(fontWeight: FontWeight.w500),
              width: 60.sp,   //158
              height: 30.sp,   //50
              onPressed: () {
                context.router.push(const MeetingRequestsListViewRoute());
              },
              text: AppString.of(context).personalRequests),
        )
      ],
    );
  }
}
