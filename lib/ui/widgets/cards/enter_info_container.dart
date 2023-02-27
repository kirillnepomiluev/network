import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnterInfoContainer extends StatelessWidget {
  const EnterInfoContainer(
      {Key? key,
        required this.text1,
        required this.text2,
        this.maxLines,
        this.description,
        this.showDescription = true,
        this.fontSize,
        this.fontWeight = FontWeight.w500,
      })
      : super(key: key);
  final String text1;
  final String text2;
  final String? description;
  final int? maxLines;
  final bool showDescription;
  final double? fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Res.s32),
      child: AppContainer(
        padV: Res.s23,   //23
        padH: Res.s17,   //17
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichTextTwo(
              text1: text1,
              text2: text2,
              fontSize: fontSize?? 20.sp,
              fontWeight1: fontWeight,
              fontWeight2: fontWeight,
            ),

            if(showDescription)
              Padding(
                padding: const EdgeInsets.only(top: 20), //20
                child: Text(
                  description ?? Constants.strLoremIpsum,
                  maxLines: maxLines,
                ),
              ),
          ],
        ),
      ),
    );
  }

}