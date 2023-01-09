import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/common/hobbits_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';

class PersonProfileStatColumn extends StatelessWidget {
  const PersonProfileStatColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50, top: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
              onPressed: () {
                context.router
                    .push(HomeStoreViewRoute(isPartnerCupboard: true));
              },
              text: 'Перейти в список вещей',
            buttonColor: AppColors.salad,
            borderColor: AppColors.salad,
            width: 225,
            height: 50,
            borderRadius: AppBorderRadius.r13,
            textStyle: AppTextStyles.black12,
          ),
          const SizedBox(height: 5,),
          const TitleStatText('Статус'),
          const SizedBox(height: 10,),
          const AppTextField(hintText: 'ищу партнеров для бизнеса', enabled: false,),
          const TitleStatText('Базовые данные'),
          const AppTextField(hintText: 'Женщина, 37 лет, свободна, цель встречи: деловая.', enabled: false,),
          const TitleStatText('Интересы'),
          const SizedBox(height: 20,),
          Wrap(
            spacing: 8,
            runSpacing: 10,
            direction: Axis.horizontal,
            children: const [
              HobbitsContainer('Большой теннис', hasEdit: false),
              HobbitsContainer('Бассейн', hasEdit: false),
              HobbitsContainer('Управление', hasEdit: false),
              HobbitsContainer('Маркетинг', hasEdit: false),
            ],
          ),
          const TitleStatText('Обо мне'),
          const AppTextField(hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.', enabled: false,),
          const TitleStatText('Сфера деятельности'),
          const AppTextField(hintText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.', enabled: false,),

        ],
      ),
    );
  }
}