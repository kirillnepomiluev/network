import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/assets.gen.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ClotheModel {
  factory ClotheModel.fromMap(Map<String, dynamic> dataMap) {
    final String rank = dataMap['rank'] == 'usual' ? 'Обычный' : 'Редкий';

    return ClotheModel(
        // title: dataMap['title'],
        // type: dataMap['type'],
        // rank: dataMap['rank'],
        // level: dataMap['level'],
        // points: dataMap['points'],
        // imageUrl: dataMap['imageUrl']
        title: dataMap['title'] ?? '',
        type: dataMap['type'] ?? '',
        rank: rank,
        level: dataMap['level'] ?? 1,
        points: dataMap['points'] ?? 0,
        cost: dataMap['cost'] ?? 0,
        imageUrl: dataMap['image_url'] ?? '');
  }
  ClotheModel({
    required this.title,
    required this.rank,
    required this.cost,
    required this.type,
    required this.level,
    required this.points,
    required this.imageUrl,
  });

  final String title;
  final String type;
  final String rank;
  final double cost;
  final int level;
  final int points;
  final String imageUrl;
}

class StoreAvatarContainer extends StatelessWidget {
  const StoreAvatarContainer(
      {Key? key,
      required this.currentNote,
      this.isViewCostume = false})
      : super(key: key);
  final Map<String, dynamic> currentNote;
  final bool isViewCostume;

  @override
  Widget build(BuildContext context) {
    final clotheModel = ClotheModel.fromMap(currentNote);
    final isCostume = clotheModel.type == 'costume';

    final mediaWidth = MediaQuery.of(context).size.width;
    final double contWidth = isViewCostume ? mediaWidth : isCostume? 65.sp : 55.sp; //217.57
    final double contHeight = isViewCostume ? contWidth * 0.65 : contWidth;
    final double pad = isViewCostume ? 30 : Res.s15;
    return InkWell(
      onTap: () {
        context.router.push(
          StoreProductViewRoute(
            clotheModel: clotheModel
            // imageURL: Assets.images.avatars.avatar3.keyName,
          ),
        );
      },
      child: AppContainer(
        padH: pad,
        padV: pad,
        radius: AppBorderRadius.r15,
        width: contWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                clotheModel.rank,
                style:
                    AppTextStyles.primary.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            AppContainer(
                height: contHeight,
                radius: AppBorderRadius.r10,
                color: Colors.transparent,
                child: clotheModel.imageUrl.isEmpty
                    ? Container()
                    : Image.network(clotheModel.imageUrl)
                ),
            SizedBox(
              height: Res.s12,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          clotheModel.title,
                          // 'Костюм "Выходной"',
                          style: AppTextStyles.salad
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text('#0863246', style: AppTextStyles.primary12),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.sp, //29
                ),

                Text(
                  '${clotheModel.cost} SOL',
                  style: AppTextStyles.salad16
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: Res.s14,
                ),

                if (isCostume)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Уровень ${clotheModel.level}',
                        style: AppTextStyles.primary12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Баллы +${clotheModel.points}',
                        style: AppTextStyles.primary12,
                      ),
                      SizedBox(
                        width: Res.s10,
                      ),
                      Transform.translate(
                        offset: const Offset(-4, 0),
                        child: Icon(
                          NetworkIcons.rhombus,
                          color: AppColors.salad,
                          size: Res.s12, //15
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Уровень ${clotheModel.level}',
                        style: AppTextStyles.primary12,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            'Баллы +${clotheModel.points}',
                            style: AppTextStyles.primary12,
                          ),
                          SizedBox(
                            width: Res.s10,
                          ),
                          Transform.translate(
                            offset: const Offset(-4, 0),
                            child: Icon(
                              NetworkIcons.rhombus,
                              color: AppColors.salad,
                              size: Res.s12, //15
                            ),
                          ),
                        ],
                      ),
                    ],
                  )

                // Wrap(
                //   spacing: Res.s10,
                //   children: [
                //     Text(
                //       'Уровень ${clotheModel.level}  Баллы +${clotheModel.points}',
                //       style: AppTextStyles.primary12,
                //     ),
                //     Transform.translate(
                //       offset: const Offset(-4, 0),
                //       child: Icon(
                //         NetworkIcons.rhombus,
                //         color: AppColors.salad,
                //         size: Res.s12, //15
                //       ),
                //     ),
                //   ],
                // ),

                // SizedBox(
                //   height: Res.s12,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
