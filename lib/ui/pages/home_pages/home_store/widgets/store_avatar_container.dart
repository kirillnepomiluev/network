import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class StoreAvatarContainer extends StatelessWidget {
  final String type;
  const StoreAvatarContainer({Key? key, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double contWidth = 65.sp; //217.57

    return InkWell(
      onTap: (() {
        context.router.push(StoreProductViewRoute(
          title: 'Костюм "Выходной"',
          imageURL: Assets.images.avatars.avatar3.keyName,
        ));
      }),
      child: AppContainer(
        padH: UtilsResponsive.getResSize(15),
        padV: UtilsResponsive.getResSize(15),
        radius: AppBorderRadius.r15,
        width: contWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                type,
                style: AppTextStyles.primary.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            AppContainer(
              height: contWidth,
              radius: AppBorderRadius.r10,
              color: Colors.transparent,
              child: Image.asset(
                type == 'Обычный'
                    ? Assets.images.avatars.avatar4.keyName
                    : Assets.images.avatars.avatar3.keyName,
                fit: BoxFit.contain,
                // height: 70.sp, //220
              ),
            ),
            SizedBox(
              height: UtilsResponsive.getResSize(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Костюм "Выходной"',
                            style: AppTextStyles.salad.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('#0863246', style: AppTextStyles.primary12),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.sp, //29
                ),

                Wrap(
                  spacing: UtilsResponsive.getResSize(10), //80
                  direction: Axis.horizontal,
                  children: [
                    Text('Уровень 6  Баллы +150',
                        style: AppTextStyles.primary12),
                    Transform.translate(
                      offset: const Offset(-4, 0),
                      child: Icon(
                        NetworkIcons.rhombus,
                        color: AppColors.salad,
                        size: UtilsResponsive.getResSize(12), //15
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: UtilsResponsive.getResSize(12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}