import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_create_pages/choose_meeting_date/choose_meeting_date_vm.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils.dart';
import 'package:network_app/utils/res.dart';


class ChooseMeetingDateView extends StatelessWidget {
  const ChooseMeetingDateView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChooseMeetingDateViewModel>(
      createModelDataEx: () => ChooseMeetingDateViewModel(context),
      builder: (context, model) {
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
                    vertical: Res.s10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarRow(
                        title: AppString.of(context).creatingOfPersonalRequest,
                      ),
                      EnterInfoContainer(
                        text1: '${AppString.of(context).pointPeriodFor} ',
                        text2: AppString.of(context).ofPlaningMeeting,
                        // showDescription: true,
                        description: 'You can change this date and time later',
                      ),
                      SizedBox(
                        height: Res.s40,
                      ),
                      InkWell(
                        onTap: model.onPickDate,
                        child: AppContainer.outlined(
                          width: double.infinity,
                          child: Text(model.startDate),
                        ),
                      ),
                      SizedBox(
                        height: Res.s20,
                      ),
                      InkWell(
                        onTap: model.onPickTime,
                        child: AppContainer.outlined(
                          width: double.infinity,
                          child: Text(model.startTime),
                        ),
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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
              left: Res.s16,
              right: Res.s16,
              bottom: Res.s23,
            ),
            child: AppButtonContinue(
              onPressed: model.onTap,
            ),
          ),
        );
      },
    );
  }
}
