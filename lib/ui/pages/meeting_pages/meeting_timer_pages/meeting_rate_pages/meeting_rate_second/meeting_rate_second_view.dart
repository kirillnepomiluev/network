import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/meeting_rate_second/rate_slider_container.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';

class MeetingRateSecondView extends StatelessWidget {
  const MeetingRateSecondView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DialogUtils.showMeetingRateInterruptDialog(context);
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBarRow(
                    onPressed: () => DialogUtils.showMeetingRateInterruptDialog,
                  ),
                  const SizedBox(
                    height: 44,
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
                  const SizedBox(
                    height: 59,
                  ),
                  const RateSliderContainer(
                    title: 'Понравилось ли вам общение?',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const RateSliderContainer(title: 'Возникла ли симпатия?'),
                  const SizedBox(
                    height: 20,
                  ),
                  const RateSliderContainer(
                      title: 'Интересна ли сфера деятельности?'),
                  const SizedBox(
                    height: 37,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: AppButton(
                      onPressed: () {
                        context.router.push(HomeViewRoute(initIndex: 0));
                      },
                      text: 'Оценить',
                    ),
                  ),
                  const SizedBox(
                    height: 36,
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
