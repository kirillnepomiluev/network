import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingTimerBottom extends StatelessWidget {
  final bool isTimer;
  final bool isPaused;
  final VoidCallback onGoTap;

  const MeetingTimerBottom({
    Key? key,
    required this.isTimer,
    required this.isPaused,
    required this.onGoTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isTimer
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: onGoTap,
                child: AppContainer(
                  width: 66, //66
                  height: 92, //92
                  color: isPaused ? AppColors.white10 : AppColors.salad,
                  radius: 37,
                  child: Center(
                    child: isPaused
                        ? Text('GO',
                            style: AppTextStyles.primary20
                                .copyWith(fontWeight: FontWeight.w600))
                        : Icon(
                            Icons.close_rounded,
                            color: Colors.black,
                            size: 20.5.sp, //20
                          ),
                  ),
                ),
              ),
            )
          : Column(
              children: [
                AppButton(
                  onPressed: () {
                    context.router.push(const MeetingQuestionsViewRoute());
                  },
                  text: 'Показать вопросы',
                ),
                const SizedBox(
                  height: 26,
                ),
                Text('Чтобы получить больше токенов,\nответеть на вопросы',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.primary16),
              ],
            ),
    );
  }
}
