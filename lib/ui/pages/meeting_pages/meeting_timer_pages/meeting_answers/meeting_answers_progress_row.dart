import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';


class MeetingAnswersProgressRow extends StatelessWidget {
  const MeetingAnswersProgressRow({
    Key? key,
   required this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UtilsResponsive.getResSize(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppContainer(
            width: UtilsResponsive.getResSize(40), //43
            height: UtilsResponsive.getResSize(40),
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
                  horizontal: UtilsResponsive.getResSize(40),//44
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
            width: UtilsResponsive.getResSize(40), //43
            height:UtilsResponsive.getResSize(40),
            radius: AppBorderRadius.r15,
            child: Center(
                child: Text(
              '3',
              style:
                  AppTextStyles.primary.copyWith(fontWeight: FontWeight.w500),
            ),),
          ),
        ],
      ),
    );
  }
}
