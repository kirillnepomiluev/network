import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/rate_slider_container.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/res.dart';


class MeetingRateSecondView extends StatelessWidget {
  const MeetingRateSecondView({Key? key, required this.meetingModel}) : super(key: key);
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Res.s16,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarRow(
                  // onPressed: () => DialogUtils.showMeetingRateInterruptDialog,
                ),
                SizedBox(
                  height: Res.s25,
                ),
                const RichTextTwo(
                  text1: 'Дайте оценку\n',
                  text2: 'каждой категории',
                  fontWeight1: FontWeight.w500,
                  fontWeight2: FontWeight.w500,
                  color1: AppColors.salad,
                  color2: AppColors.textWhite,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Res.s40,
                ),
                const RateSliderContainer(
                  title: 'Понравилось ли вам общение?',
                ),
                SizedBox(
                  height: Res.s20,
                ),
                const RateSliderContainer(title: 'Возникла ли симпатия?'),
                SizedBox(
                  height: Res.s20,
                ),
                const RateSliderContainer(
                    title: 'Интересна ли сфера деятельности?',),
                SizedBox(
                  height: Res.s35,
                ),
                AppButton(
                  onPressed: () {
                    context.router.push(HomeViewRoute());
                  },
                  text: 'Оценить',
                ),
                SizedBox(
                  height: Res.s35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
