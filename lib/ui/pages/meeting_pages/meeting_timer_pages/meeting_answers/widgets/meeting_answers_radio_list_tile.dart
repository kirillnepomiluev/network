import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';


class MeetingAnswersRadioListTile extends StatelessWidget {
  final String title;
  final String groupValue;
  final Function(String?) onAnswerTap;
  const MeetingAnswersRadioListTile(
      {Key? key,
        required this.title,
        required this.groupValue,
        required this.onAnswerTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
        visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity),
        contentPadding: EdgeInsets.zero,
        activeColor: AppColors.salad,
        value: title,
        title: Text(
          title,
        ),
        groupValue: groupValue,
        onChanged: onAnswerTap);
  }
}