import 'package:flutter/material.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';


class StoreCategoryAvatarContainer extends StatelessWidget {
  const StoreCategoryAvatarContainer({Key? key, required this.type})
      : super(key: key);
  final String type;

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contWidth = mediaWidth; //217.57
    final double imageHeight = contWidth * 0.65;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          // context.router.push(StoreProductViewRoute(
          //     clotheModel: clotheModel
          //   // imageURL: Assets.images.avatars.avatar3.keyName,
          // ),);
        },
        child: AppContainer(
          padH: 30,
          padV: 30,
          radius: AppBorderRadius.r15,
          width: contWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type,
                style: AppTextStyles.primary
                    .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: AppContainer(
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
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Костюм "Выходной"',
                              style: AppTextStyles.salad
                                  .copyWith(fontWeight: FontWeight.w600),),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('#0863246', style: AppTextStyles.primary12),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Text('1.6 SOL',
                      style: AppTextStyles.salad16
                          .copyWith(fontWeight: FontWeight.w600),),
                  const SizedBox(
                    height: 23,
                  ),

                  Wrap(
                    spacing: 10,
                    children: [
                      Text('Уровень 6  Баллы +150',
                          style: AppTextStyles.primary12,),
                      const Icon(
                        NetworkIcons.rhombus,
                        color: AppColors.salad,
                        size: 15,
                      ),
                    ],
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
