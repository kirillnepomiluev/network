import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/progress_parametr.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/utils/res.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StatColumn extends StatelessWidget {
  const StatColumn({Key? key, this.ifProfileSheet = false, required this.onBuyTokens, this.level = 0}) : super(key: key);
  final bool ifProfileSheet;
  final VoidCallback onBuyTokens;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Center(child: Text('Level $level', style: AppTextStyles.primary20, textAlign: TextAlign.center,)),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //
        //     Text('Level $level', style: AppTextStyles.primary20,),
        //
        //     // RichTextTwo(
        //     //   text1: 'Level ',
        //     //   text2: '$level',
        //     // ),
        //     Padding(
        //       padding: EdgeInsets.only(right: Res.s10),
        //       child: Container(
        //         decoration: BoxDecoration(
        //             color: AppColors.salad,
        //             borderRadius: BorderRadius.circular(7),),
        //         width: Res.s24,
        //         height: Res.s22,
        //         child: Icon(
        //           Icons.mode_edit_outline_outlined,
        //           size: Res.s13,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        const SizedBox(
          height: 5,
        ),

        ProgressParametr(
            progress: 0.3,
            text1: 'Tokens for meetings  ',
            text2: '${level*100}',
            icon: NetworkIcons.rhombus,),

        // SizedBox(
        //   height: Res.s15,
        // ),

        if (ifProfileSheet)
          RichTextTwo(
            text1: 'It remains to score to the next level ',
            text2: '1500 tokens',
            fontSize: Res.s14,
            fontWeight1: FontWeight.w500,
            fontWeight2: FontWeight.w500,
          ),

        if (ifProfileSheet)
          Padding(
            padding: EdgeInsets.only(
                top: Res.s25,
                // bottom: 8.sp,
            ),
            child:
            AppButton(
              onPressed: () {},
              text: 'Buy more tokens',
              width: null,
              height: 28.5.sp,
              buttonColor: AppColors.salad,
              textStyle: AppTextStyles.black,
              borderColor: AppColors.salad,
              borderRadius: AppBorderRadius.r10,
            ),
          ),

        if (ifProfileSheet)
          const ProgressParametr(
              text1: '5 meetings',
              text2: 'It remains 25 meetings',
              progress: 0.25,
              isMeetingRow: true,
              icon: NetworkIcons.people,),

        // TitleStatText('Statistics'),
        const ProgressParametr(
            text1: 'Energy for meetings  ',
            text2: '3/5',
            icon: NetworkIcons.electric,),

        const ProgressParametr(
            text1: 'Recovery speed  ',
            text2: 'x1.5',
            icon: NetworkIcons.speedometer,),
        // const ProgressParametr(
        //     text1: 'Tokens for meetings  ',
        //     text2: '150',
        //     icon: NetworkIcons.rhombus,),
        // const ProgressParametr(
        //   text1: 'Количество сообщений в день  ',
        //   text2: '200',
        //   icon: NetworkIcons.email_outlined,
        //   // Icons.email_outlined
        // ),
        // const ProgressParametr(
        //     text1: 'Количество лайков в день  ',
        //     text2: '50',
        //     icon: NetworkIcons.heart,),
      ],
    );
  }
}
