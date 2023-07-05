import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/home_pages/home_profile/widgets/app_wrap_containers_with_remove.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/texts/title_stat_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PersonProfileStatColumn extends StatelessWidget {
  const PersonProfileStatColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
              onPressed: () {
                context.router
                    .push(HomeStoreViewRoute(isPartnerCupboard: true));
              },
              text: 'View the cupboard',
            buttonColor: AppColors.salad,
            borderColor: AppColors.salad,
            width: 60.sp,   //158
            height: 30.sp,   //50
            borderRadius: AppBorderRadius.r13,
            textStyle: AppTextStyles.black12,
          ),
          const SizedBox(height: 5,),
          const TitleStatText('Status'),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text("I'm looking for new friends 🤝", style: AppTextStyles.primary16,),
          ),
          // const TitleStatText('About me'),
          // const SizedBox(height: 10,),
          // const AppTextField(initialValue: 'Женщина, 37 лет, свободна, цель встречи: деловая.', enabled: false,),
          const TitleStatText('Interests'),
          const SizedBox(height: 15,),
          const AppWrapContainersWithRemove(listOptions: ['Big tennis', 'Books', 'Anime', 'Music', 'Horrors']),


          // Wrap(
          //   spacing: 8,
          //   runSpacing: 10,
          //   direction: Axis.horizontal,
          //   children: const [
          //     AppContainerWithRemove(title: 'Большой теннис', hasRemove: false,),
          //     AppContainerWithRemove(title: 'Бассейн', hasRemove: false,),
          //     AppContainerWithRemove(title: 'Управление', hasRemove: false,),
          //     AppContainerWithRemove(title: 'Маркетинг', hasRemove: false,),
          //   ],
          // ),
          const TitleStatText('About me'),
          const SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text("I like to play tennis on weekends and I love watching anime'", style: AppTextStyles.primary16,),
          ),
          // const AppTextField(initialValue: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultrices amet tellus.', ),
          const TitleStatText('Occupation'),
          const SizedBox(height: 15,),
          const AppWrapContainersWithRemove(listOptions: ['IT', 'Design', 'Management', ]),

          // const AppTextField(initialValue: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget varius a id in amet.',),
        ],
      ),
    );
  }
}
