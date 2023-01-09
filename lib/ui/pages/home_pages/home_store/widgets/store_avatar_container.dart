import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_card.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';


class StoreAvatarContainer extends StatelessWidget {
  final String type;
  const StoreAvatarContainer({Key? key, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contWidth = 0.58 * mediaWidth; //217.57
    final double imageHeight = contWidth;

    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: (() {
          context.router.push(StoreProductViewRoute(
            title: 'Костюм "Выходной"',
            imageURL: Assets.images.avatars.avatar3.keyName,
          ));
        }),
        child: AppContainer(
          padH: 15,
          padV: 15,
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
                height: imageHeight,
                radius: AppBorderRadius.r10,
                color: Colors.transparent,
                child: Image.asset(
                  type == 'Обычный'
                      ? Assets.images.avatars.avatar4.keyName
                      : Assets.images.avatars.avatar3.keyName,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 12,
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
                  const SizedBox(
                    height: 29,
                  ),

                  Wrap(
                    spacing: 10, //80
                    direction: Axis.horizontal,
                    children: [
                      Text('Уровень 6  Баллы +150',
                          style: AppTextStyles.primary12),
                      const Icon(
                        NetworkIcons.rhombus,
                        color: AppColors.salad,
                        size: 15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}