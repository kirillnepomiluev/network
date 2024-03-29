import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class BottomSheetInfoWithIcon extends StatelessWidget {
  const BottomSheetInfoWithIcon({
    Key? key,
    required this.icon,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.textButton,
    this.func,
  }) : super(key: key);
  final IconData icon;
  final String text1;
  final String text2;
  final String text3;
  final String textButton;
  final VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;

    return BlurryContainer(
      height: mediaHeight*0.8,
      blur: 30,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [

          Padding(
            padding: EdgeInsets.only(
              top: 35.sp, //69
            ),
            child: Icon(
              icon,
              size: 45.sp, //100
              color: AppColors.salad,
            ),
          ),

          // SizedBox(height: 35.sp,),  //69

          Column(
            children: [
              RichTextTwo(
                text1: text1,
                text2: text2,
              ),
              SizedBox(height: Res.s35,),
              Text(
                text3,
                textAlign: TextAlign.center,
              ),
            ],
          ),

          // const SizedBox(height: 150,),

          Padding(
            padding: EdgeInsets.only(bottom: Res.s20),
            child: AppButton(
              onPressed: func?? context.router.pop,
              text: textButton,
            ),
          ),
        ],
      ),
    );
  }
}
