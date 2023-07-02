import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/utils/res.dart';


class MeetingAnswersProgressRow extends StatelessWidget {
  const MeetingAnswersProgressRow({
    Key? key,
   required this.progress, required this.questionCount,
  }) : super(key: key);

  final double progress;
  final int questionCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Res.s16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppContainer(
            width: Res.s40, //43
            height: Res.s40,
            radius: AppBorderRadius.r15,
            child: Center(
                child: Text(
              '1',
              style: AppTextStyles.primary.copyWith(fontWeight: FontWeight.w500),
            ),),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Res.s40,//44
                  ),
              child: LinearProgressIndicator(
                backgroundColor: AppColors.white10,
                color: AppColors.salad,
                minHeight: 4,
                value: progress,
              ),
            ),
          ),
          AppContainer(
            width: Res.s40, //43
            height:Res.s40,
            radius: AppBorderRadius.r15,
            child: Center(
                child: Text(
              '$questionCount',
              style:
                  AppTextStyles.primary.copyWith(fontWeight: FontWeight.w500),
            ),),
          ),
        ],
      ),
    );
  }
}
