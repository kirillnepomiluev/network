import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_first/meeting_rate_fisrt._vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/widgets/add_comment_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/widgets/rate_slitder_custom.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: Res.s16,),
                          child: const AppBarRow(),
                        ),
                        SizedBox(
                          height: 22.sp, //60
                        ),
                        const RichTextTwo(
                          text1: 'Как прошла ',
                          text2: 'встреча?',
                          color1: AppColors.salad,
                          color2: AppColors.textWhite,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Icon(
                          NetworkIcons.smile_wave,
                          size: 45.sp, //100
                          color: AppColors.salad,
                        ),
                        SizedBox(
                          height: 43.sp, //93
                        ),
                        const SliderCustom(
                          min: 0,
                          max: 100,
                          showLabelsRow: false,
                          sLiderValue: 50,
                          // stepSize: 5
                        ),
                        SizedBox(
                          height: Res.s60, //60
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Res.s20,
                            ),
                            child: const AddCommentRow(),),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: Res.s16,
                        right: Res.s16,
                        bottom: Res.s35,
                      ),
                      child: AppButton(
                          onPressed: () {
                            context.router
                                .push(const MeetingRateSecondViewRoute());
                          },
                          text: 'Далее',),
                    ),
                  ],
                ),
              ),
            ),
          );
        },);
  }
}
