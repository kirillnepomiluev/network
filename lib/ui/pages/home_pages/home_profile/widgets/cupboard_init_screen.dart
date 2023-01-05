import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/store_pages/store_avatars_pages/store_category_avatars/store_category_avatars_view.dart';
import 'package:network_app/ui/pages/store_pages/store_headwears_pages/store_category_headwears/store_category_headwears.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CupboardInitScreen extends StatelessWidget {
  final ScrollController avatarScrollContr;
  final ScrollController hatScrollContr;
  final ActiveProfileTab activeTab;
  const CupboardInitScreen({
    Key? key, required this.avatarScrollContr, required this.hatScrollContr, required this.activeTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Аватары
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15, right: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.of(context).avatars,
                style: AppTextStyles.primary22w6,
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    context.router.push(const StoreCategoryAvatarsViewRoute());
                  },
                  icon: const Icon(
                    NetworkIcons.arrow_long_right,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
          ),
        ),

        //Карусель аватаров
        SingleChildScrollView(
          controller: avatarScrollContr,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (var i = 0; i < 6; i++)
                avatarContainer(
                  strCategory: i % 2 == 0
                      ? AppString.of(context).rare
                      : AppString.of(context).usual,
                  context: context,
                ),
            ],
          ),
        ),

        //Головные уборы
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.of(context).headwears,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.5.sp, //22
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    context.router.push(const StoreCategoryHeadwearsViewRoute());
                  },
                  icon: const Icon(
                    NetworkIcons.arrow_long_right,
                    color: Colors.white,
                    size: 25,
                  ))
            ],
          ),
        ),

        //Карусель головных уборов
        Padding(
          padding: const EdgeInsets.only(bottom: 85),
          child: SingleChildScrollView(
            controller: hatScrollContr,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (var i = 0; i < 6; i++)
                  hatContainer(
                    strCategory: i % 2 == 0
                        ? AppString.of(context).rare
                        : AppString.of(context).usual,
                    context: context,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
