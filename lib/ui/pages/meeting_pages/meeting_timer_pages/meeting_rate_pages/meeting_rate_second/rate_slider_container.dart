import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/widgets/add_comment_row.dart';
import 'package:network_app/ui/pages/meeting_pages/meeting_timer_pages/meeting_rate_pages/widgets/rate_slitder_custom.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/utils_responsive.dart';


class RateSliderContainer extends StatelessWidget {
  final String title;
  const RateSliderContainer({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: UtilsResponsive.getResSize(17),
          horizontal: UtilsResponsive.getResSize(20)
      ),
      decoration: BoxDecoration(
          color: AppColors.white10, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: AppTextStyles.primary16),
          Padding(
            padding: EdgeInsets.only(top: UtilsResponsive.getResSize(20)),
            child: Column(
              children: [
                const SliderCustom(
                  sLiderValue: 0,
                  min: 0,
                  max: 5,
                  showLabelsRow: true,
                  stepSize: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: UtilsResponsive.getResSize(32)),
                  child: const AddCommentRow(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
