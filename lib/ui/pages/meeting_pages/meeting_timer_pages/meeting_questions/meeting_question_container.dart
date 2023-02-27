import 'package:flutter/material.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
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
      padH: Res.s10,
      padV: Res.s10,
      // width: 48.sp, //158
      height: 46.sp, //112
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: Res.s12, //12
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible,),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
