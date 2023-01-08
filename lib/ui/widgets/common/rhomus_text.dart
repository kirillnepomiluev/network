import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';


class RhombusText extends StatelessWidget {
  final double iconSize;
  final double fontSize;
  final double padLeft;
  final FontWeight fontWeight;
  const RhombusText({
    Key? key,
    this.iconSize = 15,
    this.fontSize = 14,
    this.padLeft = 5,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '+150',
          style: TextStyle(
              fontSize: fontSize, //14
              color: AppColors.salad,
              fontWeight: fontWeight),
        ),
        Padding(
          padding: EdgeInsets.only(left: padLeft),
          child: Icon(
            NetworkIcons.rhombus,
            color: AppColors.salad,
            size: iconSize,
          ),
        )
      ],
    );
  }
}
