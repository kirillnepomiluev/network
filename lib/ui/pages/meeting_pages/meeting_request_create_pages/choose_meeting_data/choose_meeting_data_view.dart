import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_request_create_pages/choose_meeting_data/widgets/custom_calendart.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/utils_responsive.dart';

class ChooseMeetingDateView extends StatefulWidget {
  const ChooseMeetingDateView({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseMeetingDateView> createState() => _ChooseMeetingDateViewState();
}

class _ChooseMeetingDateViewState extends State<ChooseMeetingDateView> {
  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: Utils.unFocus,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Res.s16,
                  vertical: Res.s10,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarRow(
                    title: AppString.of(context).creatingOfPersonalRequest,
                  ),
                  EnterInfoContainer(
                    text1: '${AppString.of(context).pointPeriodFor} ',
                    text2: AppString.of(context).ofPlaningMeeting,
                    description:
                        'Здесь будет небольшое описание, что именно здесь нужно указать',
                  ),
                  SizedBox(
                    height: Res.s40,
                  ),
                  Text(AppString.of(context).chooseDateOfStart,
                      style: AppTextStyles.primary20
                          .copyWith(fontWeight: FontWeight.w600),),
                  SizedBox(
                    height: Res.s20,
                  ),
                  const CustomCalendar(),
                  Padding(
                    padding: EdgeInsets.only(top: Res.s40, bottom: Res.s20),
                    child: Text(AppString.of(context).chooseDateOfEnd,
                        style: AppTextStyles.primary20
                            .copyWith(fontWeight: FontWeight.w600),),
                  ),
                  const CustomCalendar(),
                  SizedBox(
                    height: Res.s20,
                  ),
                  AppButtonContinue(
                    onPressed: () {
                      context.router
                          .push(const CheckMeetingParametersViewRoute());
                    },
                  ),
                  SizedBox(
                    height: Res.s20,
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
