import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';


class MeetingQuestionContainer extends StatelessWidget {
  final String text;
  const MeetingQuestionContainer({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contSize = mediaWidth * 0.42;
    return Container(
      padding: EdgeInsets.all(0.0266 * mediaWidth), //10
      width: contSize,
      height: contSize * 0.74, //112
      decoration: BoxDecoration(
          color: AppColors.white10, borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 12, //12
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.visible),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
