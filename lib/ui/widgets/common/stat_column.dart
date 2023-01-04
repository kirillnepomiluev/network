import 'package:network_app/ui/widgets/progress_parametr.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';

class StatColumn extends StatelessWidget {
  final bool ifProfileSheet;
  const StatColumn({Key? key, this.ifProfileSheet = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // titleStatText('Уровень Базовый'),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const RichTextTwo(
              text1: 'Уровень ',
              text2: 'Базовый',
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.salad100,
                  borderRadius: BorderRadius.circular(7)),
              width: 24,
              height: 22,
              child: const Icon(
                Icons.mode_edit_outline_outlined,
                size: 13,
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
            icon: NetworkIcons.rhombus),

        const SizedBox(
          height: 15,
        ),

        if (ifProfileSheet)
          const RichTextTwo(
            text1: 'До следущего уровня осталось\nнабрать ',
            text2: '1500 токенов',
            fontSize: 14,
            fontWeight1: FontWeight.w500,
            fontWeight2: FontWeight.w500,
          ),

        if (ifProfileSheet)
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 7),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    backgroundColor: AppColors.salad100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13))),
                onPressed: () {},
                child: const Text(
                  "Докупить токены",
                  style: TextStyle(color: AppColors.textBlack),
                )),
          ),

        if (ifProfileSheet)
          const ProgressParametr(
              text1: '5 встреч',
              text2: 'Еще 25 встреч',
              progress: 0.25,
              isMeetingRow: true,
              icon: NetworkIcons.people),

        const TitleStatText('Статистика'),
        const ProgressParametr(
            text1: 'Энергии на встречи  ',
            text2: '3/5',
            icon: NetworkIcons.electric),

        const ProgressParametr(
            text1: 'Скорость восстановления  ',
            text2: 'x1.5',
            icon: NetworkIcons.speedometer),
        const ProgressParametr(
            text1: 'Баллы за встречи  ',
            text2: '150',
            icon: NetworkIcons.rhombus),
        const ProgressParametr(
          text1: 'Количество сообщений в день  ',
          text2: '200',
          icon: NetworkIcons.email_outlined,
          // Icons.email_outlined
        ),
        const ProgressParametr(
            text1: 'Количество лайков в день  ',
            text2: '50',
            icon: NetworkIcons.heart),
      ],
    );
  }
}
