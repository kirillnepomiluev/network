import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_avatar_container.dart';
import 'package:network_app/ui/pages/home_pages/home_store/widgets/store_headwear_container.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/main_enums.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CupboardInitScreen extends StatelessWidget {
  const CupboardInitScreen({
    Key? key, required this.avatarScrollContr, required this.hatScrollContr, required this.activeTab,
  }) : super(key: key);
  final ScrollController avatarScrollContr;
  final ScrollController hatScrollContr;
  final ActiveProfileTabs activeTab;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Аватары
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppString.of(context).avatars,
                style: AppTextStyles.primary22.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    // context.router.push(const StoreCategoryAvatarsViewRoute());
                    context.router.push(StoreCategoryViewRoute(storeProductType: StoreProductType.avatars,));
                  },
                  icon: const Icon(
                    NetworkIcons.arrow_long_right,
                    color: Colors.white,
                    size: 25,
                  ),)
            ],
          ),
        ),

        //Карусель аватаров
        SingleChildScrollView(
          controller: avatarScrollContr,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < 6; i++)
                StoreAvatarContainer(
                  type:
                  // i % 2 == 0
                  i.isEven
                      ? AppString.of(context).rare
                      : AppString.of(context).usual,
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
                    fontWeight: FontWeight.w600,),
                textAlign: TextAlign.start,
              ),
              IconButton(
                  onPressed: () {
                    // context.router.push(const StoreCategoryHeadwearsViewRoute());
                    context.router.push(StoreCategoryViewRoute(storeProductType: StoreProductType.avatars,));
                  },
                  icon: const Icon(
                    NetworkIcons.arrow_long_right,
                    color: Colors.white,
                    size: 25,
                  ),)
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
              children: [
                for (var i = 0; i < 6; i++)
                  StoreHeadwearContainer(
                    type:
                    // i % 2 == 0
                    i.isEven
                        ? AppString.of(context).rare
                        : AppString.of(context).usual,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
