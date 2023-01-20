import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/progress_parametr.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StatColumn extends StatelessWidget {
  const StatColumn({Key? key, this.ifProfileSheet = false}) : super(key: key);
  final bool ifProfileSheet;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RichTextTwo(
              text1: 'Уровень ',
              text2: 'Базовый',
            ),
            Padding(
              padding: EdgeInsets.only(right: UtilsResponsive.getResSize(10)),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.salad,
                    borderRadius: BorderRadius.circular(7),),
                width: UtilsResponsive.getResSize(24),
                height: UtilsResponsive.getResSize(22),
                child: Icon(
                  Icons.mode_edit_outline_outlined,
                  size: UtilsResponsive.getResSize(13),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 5,
        ),

        const ProgressParametr(
            progress: 0.3,
            text1: 'Токены за встречи  ',
            text2: '150',
            icon: NetworkIcons.rhombus,),

        SizedBox(
          height: UtilsResponsive.getResSize(15),
        ),

        if (ifProfileSheet)
          RichTextTwo(
            text1: 'До следущего уровня осталось\nнабрать ',
            text2: '1500 токенов',
            fontSize: UtilsResponsive.getResSize(14),
            fontWeight1: FontWeight.w500,
            fontWeight2: FontWeight.w500,
          ),

        if (ifProfileSheet)
          Padding(
            padding: EdgeInsets.only(
                top: UtilsResponsive.getResSize(25),
                bottom: 8.sp,
            ),
            child:
            AppButton(
              onPressed: () {},
              text: 'Докупить токены',
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
              text1: '5 встреч',
              text2: 'Еще 25 встреч',
              progress: 0.25,
              isMeetingRow: true,
              icon: NetworkIcons.people,),

        const TitleStatText('Статистика'),
        const ProgressParametr(
            text1: 'Энергии на встречи  ',
            text2: '3/5',
            icon: NetworkIcons.electric,),

        const ProgressParametr(
            text1: 'Скорость восстановления  ',
            text2: 'x1.5',
            icon: NetworkIcons.speedometer,),
        const ProgressParametr(
            text1: 'Баллы за встречи  ',
            text2: '150',
            icon: NetworkIcons.rhombus,),
        const ProgressParametr(
          text1: 'Количество сообщений в день  ',
          text2: '200',
          icon: NetworkIcons.email_outlined,
          // Icons.email_outlined
        ),
        const ProgressParametr(
            text1: 'Количество лайков в день  ',
            text2: '50',
            icon: NetworkIcons.heart,),
      ],
    );
  }
}
