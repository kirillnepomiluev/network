import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';


class MeetingAnswersProgressRow extends StatelessWidget {
  const MeetingAnswersProgressRow({
    Key? key,
   required this.progress,
  }) : super(key: key);

  final double progress;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppContainer(
            width: 0.1146 * mediaWidth, //43
            height: 0.1146 * mediaWidth,
            radius: AppBorderRadius.r15,
            child: Center(
                child: Text(
              '1',
              style: AppTextStyles.primary.copyWith(fontWeight: FontWeight.w500),
            )),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.1173 * mediaWidth //44
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
            width: 0.1146 * mediaWidth, //43
            height: 0.1146 * mediaWidth,
            radius: AppBorderRadius.r15,
            child: Center(
                child: Text(
              '3',
              style:
                  AppTextStyles.primary.copyWith(fontWeight: FontWeight.w500),
            )),
          ),
        ],
      ),
    );
  }
}
