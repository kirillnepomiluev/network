import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/meeting_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingTimerBottom extends StatelessWidget {

  const MeetingTimerBottom({
    Key? key,
    required this.isTimer,
    required this.isPaused,
    required this.onGoTap, required this.meetingModel,
  }) : super(key: key);
  final bool isTimer;
  final bool isPaused;
  final VoidCallback onGoTap;
  final MeetingModel meetingModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isTimer
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: InkWell(
                onTap: onGoTap,
                child: AppContainer(
                  width: 35.sp, //66
                  height: 35.sp * 1.394, //92
                  color: isPaused ? AppColors.white10 : AppColors.salad,
                  radius: 37,
                  child: Center(
                    child: isPaused
                        ? Text('GO',
                            style: AppTextStyles.primary20
                                .copyWith(fontWeight: FontWeight.w600),)
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
                    context.router.push(MeetingQuestionsViewRoute(meetingModel: meetingModel));
                  },
                  text: 'Показать вопросы',
                ),
                SizedBox(
                  height: Res.s26,
                ),
                Text('Чтобы получить больше токенов,\nответеть на вопросы',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.primary16,),
              ],
            ),
    );
  }
}
