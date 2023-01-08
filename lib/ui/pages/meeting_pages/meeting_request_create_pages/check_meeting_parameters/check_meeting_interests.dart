import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/icons/app_icon_container.dart';
import 'package:network_app/ui/widgets/texts/rich_text_two.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CheckMeetingInterests extends StatelessWidget {
  const CheckMeetingInterests({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleStatText(AppString.of(context).interestsTitle),
        const SizedBox(
          height: 20,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 10,
          direction: Axis.horizontal,
          children: [
            const HobbitsContainer('Большой теннис'),
            const HobbitsContainer('Бассейн'),
            const HobbitsContainer('Управление'),
            const HobbitsContainer('Маркетинг'),
            AppIconContainer(
              icon: Icons.add,
              contSize: 25.sp,
              iconSize: 17.5.sp,
              contColor: AppColors.salad,
              iconColor: Colors.black,
              radius: AppBorderRadius.r7,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const RichTextTwo(
          text1: 'Вы можете указать ',
          text2: 'до 10 интересов',
          fontSize: 10,
          fontWeight1: FontWeight.w400,
          fontWeight2: FontWeight.w400,
        ),

      ],
    );
  }
}
