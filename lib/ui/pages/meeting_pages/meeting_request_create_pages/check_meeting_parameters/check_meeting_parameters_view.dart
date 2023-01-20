import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_category_of_meeting.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_date.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_description_of_meeting.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_interests.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_occupation.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/utils_responsive.dart';

class CheckMeetingParametersView extends StatelessWidget {
  const CheckMeetingParametersView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: UtilsResponsive.getResSize(16),
                  vertical: UtilsResponsive.getResSize(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),
                  EnterInfoContainer(
                    text1: '${AppString.of(context).check} ',
                    text2: AppString.of(context).allParametrsOfMeeting,
                    showDescription: false,
                    fontSize: UtilsResponsive.getResSize(24),
                  ),
                  const CheckMeetingCategoryOfMeeting(),
                  const CheckMeetingDescriptionOfMeeting(),
                  const CheckMeetingOccupation(),
                  SizedBox(
                    height: UtilsResponsive.getResSize(20),
                  ),
                  const CheckMeetingInterests(),
                  SizedBox(
                    height: UtilsResponsive.getResSize(20),
                  ),
                  const CheckMeetingDate(),
                  SizedBox(
                    height: UtilsResponsive.getResSize(40),
                  ),
                  AppButton(
                    onPressed: () {
                      context.router.push(HomeViewRoute());
                    },
                    text: AppString.of(context).createRequest,
                  ),
                  SizedBox(
                    height: UtilsResponsive.getResSize(20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
