import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';


class RhombusText extends StatelessWidget {
  const RhombusText({
    Key? key,
    this.iconSize,
    this.fontSize,
    this.padLeft = 5,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);
  final double? iconSize;
  final double? fontSize;
  final double padLeft;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '+150',
          style: TextStyle(
              fontSize: fontSize??Res.s14, //14
              color: AppColors.salad,
              fontWeight: fontWeight,),
        ),
        Padding(
          padding: EdgeInsets.only(left: padLeft),
          child: Icon(
            NetworkIcons.rhombus,
            color: AppColors.salad,
            size: iconSize??Res.s15,
          ),
        )
      ],
    );
  }
}
