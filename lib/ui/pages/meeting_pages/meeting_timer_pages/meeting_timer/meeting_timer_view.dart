import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_bottom.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/widgets/meeting_timer_circle.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_timer/meeting_timer_vm.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/view_model/view_model_builder.dart';

class MeetingTimerView extends StatelessWidget {
  final bool isTimer;
  const MeetingTimerView({Key? key, this.isTimer = false}) : super(key: key);

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppBarRow(onPressed: model.onBackTap),
                        const SizedBox(
                          height: 30,
                        ),
                        MeetingTimerCircle(
                            strMinutes: model.strMinutes,
                            strSeconds: model.strSeconds,
                            animationDuration: model.maxSeconds,
                            valueNotifier: model.valueNotifier),
                        const SizedBox(
                          height: 50,
                        ),
                        Text(
                            model.isPaused
                                ? 'Начните встречу'
                                : 'до конца встречи',
                            style: AppTextStyles.primary22),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          'Минимальное время встречи\nдля начисления баллов 20 минут',
                          style: AppTextStyles.primary16,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 91,
                        ),
                        MeetingTimerBottom(
                            isTimer: isTimer,
                            isPaused: model.isPaused,
                            onGoTap: model.onGoTap
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
