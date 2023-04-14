import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_vm.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_bottom.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_circle.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingTimerView extends StatelessWidget {
  const MeetingTimerView({Key? key, this.isTimer = false}) : super(key: key);
  final bool isTimer;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MeetingTimerViewModel>(
        createModelDataEx: () => MeetingTimerViewModel(context),
        builder: (context, model) {
          return WillPopScope(
            onWillPop: model.onWillPop,
            child: SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Res.s16,
                        vertical: Res.s10,
                    ),
                    child: Column(
                      children: [
                        AppBarRow(onPressed: model.onBackTap),
                        SizedBox(
                          height: 23.sp, //30
                        ),
                        MeetingTimerCircle(
                            strMinutes: model.strMinutes,
                            strSeconds: model.strSeconds,
                            animationDuration: model.maxSeconds,
                            valueNotifier: model.valueNotifier
                        ),
                        SizedBox(
                          height: 29.sp, //50
                        ),
                        Text(
                            model.isPaused
                                ? 'Начните встречу'
                                : 'до конца встречи',
                            style: AppTextStyles.primary22,),
                        SizedBox(
                          height: Res.s24,
                        ),
                        Text(
                          'Минимальное время встречи\nдля начисления баллов 20 минут',
                          style: AppTextStyles.primary16,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 35.sp, //91
                        ),
                        MeetingTimerBottom(
                            isTimer: isTimer,
                            isPaused: model.isPaused,
                            onGoTap: model.onGoTap,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },);
  }
}
