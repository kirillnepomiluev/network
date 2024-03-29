import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class MeetingTimerCircle extends StatelessWidget {
  const MeetingTimerCircle({
    Key? key,
    required this.strMinutes,
    required this.strSeconds,
    required this.animationDuration,
    required this.valueNotifier,
  }) : super(key: key);

  final String strMinutes;
  final String strSeconds;
  final int animationDuration;
  final ValueNotifier<double> valueNotifier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Res.s20),
        child: SimpleCircularProgressBar(
          backStrokeWidth: Res.s26, //28
          progressStrokeWidth: Res.s26,
          size: 65.sp, //281
          backColor: AppColors.white10,
          progressColors: const [AppColors.salad],
          animationDuration: animationDuration,
          valueNotifier: valueNotifier,
          mergeMode: true,
          onGetText: (double value) {
            return Text('$strMinutes:$strSeconds',
                style: AppTextStyles.primary38
                    .copyWith(fontWeight: FontWeight.w700),);
          },
        ),
      ),
    );
  }
}
