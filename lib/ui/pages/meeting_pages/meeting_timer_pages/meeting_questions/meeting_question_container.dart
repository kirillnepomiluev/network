import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MeetingQuestionContainer extends StatelessWidget {
  const MeetingQuestionContainer({
    Key? key, required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padH: UtilsResponsive.getResSize(10),
      padV: UtilsResponsive.getResSize(10),
      // width: 48.sp, //158
      height: 46.sp, //112
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: UtilsResponsive.getResSize(12), //12
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible,),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
