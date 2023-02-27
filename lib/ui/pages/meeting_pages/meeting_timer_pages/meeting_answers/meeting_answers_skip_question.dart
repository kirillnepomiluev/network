import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/utils/utils_responsive.dart';

class MeetingAnswersSkipQuestion extends StatelessWidget {
  const MeetingAnswersSkipQuestion({
    Key? key, required this.sendFunction, required this.missedCount,
  }) : super(key: key);
  final Function({bool isMissing}) sendFunction;
  final int missedCount;

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
              padH: Res.s18,
              radius: AppBorderRadius.r15,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.5),
                    child: Text(
                      'Пропустить этот вопрос',
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 11),
                      child: AppIconContainer(
                        contSize: Res.s21,
                        contColor: AppColors.salad,
                        boxShape: BoxShape.circle,
                        icon: Icons.close_rounded,
                        iconColor: Colors.black,
                        iconSize: Res.s12,
                      ),)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, left: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Вы можете пропустить ', style: AppTextStyles.grey10),
              Text('$missedCount вопроса',
                  style: AppTextStyles.salad10,),
            ],
          ),
        ),
      ],
    );
  }
}
