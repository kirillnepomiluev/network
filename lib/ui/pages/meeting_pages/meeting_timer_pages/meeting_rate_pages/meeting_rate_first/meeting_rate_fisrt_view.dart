import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_first/meeting_rate_fisrt._vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/widgets/add_comment_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/widgets/rate_slitder_custom.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';

class MeetingRateFirstView extends StatefulWidget {
  const MeetingRateFirstView({Key? key}) : super(key: key);

  @override
  State<MeetingRateFirstView> createState() => _MeetingRateFirstViewState();
}

class _MeetingRateFirstViewState extends State<MeetingRateFirstView> {

  @override
  Widget build(BuildContext context) {
  return ViewModelBuilder<MeetingRateFirstViewModel>(
      createModelDataEx: () => MeetingRateFirstViewModel(context),
      builder: (context, model) {
        return WillPopScope(
          onWillPop: () async {
            DialogUtils.showMeetingRateInterruptDialog(context);
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 16, top: 10),
                      child: AppBackButton(),
                    ),
                    const SizedBox(
                      height: 59,
                    ),
                    const RichTextTwo(
                      text1: 'Как прошла ',
                      text2: 'встреча?',
                      color1: AppColors.salad,
                      color2: AppColors.textWhite,
                    ),
                    const SizedBox(
                      height: 131,
                    ),
                    const Icon(
                      NetworkIcons.smile_wave,
                      size: 100,
                      color: AppColors.salad,
                    ),
                    const SizedBox(
                      height: 93,
                    ),
                    const SliderCustom(
                      min: 0,
                      max: 100,
                      showLabelsRow: false,
                      sLiderValue: 50,
                      // stepSize: 5
                    ),
                    const SizedBox(
                      height: 65,
                    ),
                    const Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: AddCommentRow(
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: AppButton(
                          onPressed: () {
                            context.router.push(const MeetingRateSecondViewRoute());
                          },
                          text: 'Далее'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

}
