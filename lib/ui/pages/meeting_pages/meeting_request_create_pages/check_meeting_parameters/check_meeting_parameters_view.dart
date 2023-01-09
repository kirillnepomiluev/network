import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_category_of_meeting.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_date.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_description_of_meeting.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_interests.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/check_meeting_parameters/check_meeting_occupation.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),
                  EnterInfoContainer(
                    text1: '${AppString.of(context).check} ',
                    text2: AppString.of(context).allParametrsOfMeeting,
                    padTop: 40,
                    showDescription: false,
                    fontSize: 24,
                  ),
                  const CheckMeetingCategoryOfMeeting(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CheckMeetingDescriptionOfMeeting(),
                  const CheckMeetingOccupation(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CheckMeetingInterests(),
                  const SizedBox(
                    height: 20,
                  ),
                  const CheckMeetingDate(),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                    onPressed: () {
                      context.router.push(HomeViewRoute(initIndex: 0));
                    },
                    text: AppString.of(context).createRequest,
                  ),
                  const SizedBox(
                    height: 20,
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
