import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/meetings_main/widgets/meeting_tab.dart';
import 'package:network_app/ui/pages/meeting_pages/creqte_request_pages/personal_requests.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';


class ChooseMeetingScreen extends StatelessWidget {
  final ActiveMeetingTab activeTab;
  final Function(ActiveMeetingTab) changeTab;
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
          tabName: ActiveMeetingTab.forYou,
        ),
        MeetingTab(
          text: AppString.of(context).near,
          activeTab: activeTab,
          changeTab: changeTab,
          tabName: ActiveMeetingTab.near,
        ),
        Flexible(
          child: AppButton(
              borderRadius: AppBorderRadius.r15,
              textStyle: AppTextStyles.black11w5,
              width: 158,
              height: 50,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => const PersonalRequestsPage()));
              },
              text: AppString.of(context).personalRequests),
        )
      ],
    );
  }
}
