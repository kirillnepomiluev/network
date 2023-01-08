import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MeetingAnswersSkipQuestion extends StatelessWidget {
  final Function({bool isMissing}) sendFunction;
  final int missedCount;
  const MeetingAnswersSkipQuestion({
    Key? key, required this.sendFunction, required this.missedCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 42),
          child: InkWell(
            onTap: () {
              sendFunction(isMissing: true);
            },
            child: AppContainer(
              padV: 3,
              padH: 18,
              radius: AppBorderRadius.r15,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.5),
                    child: Text(
                      'Пропустить этот вопрос',
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 11, top: 1),
                      child: AppIconContainer(
                        contSize: 21,
                        contColor: AppColors.salad,
                        boxShape: BoxShape.circle,
                        icon: Icons.close_rounded,
                        iconColor: Colors.black,
                        iconSize: 15.5.sp,
                      ))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Вы можете пропустить ', style: AppTextStyles.grey10),
              Text('$missedCount вопроса',
                  style: AppTextStyles.salad10),
            ],
          ),
        ),
      ],
    );
  }
}
