import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/models/clothe_model.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/cards/app_container.dart';
import 'package:network_app/ui/widgets/common/rhomus_text.dart';
import 'package:network_app/utils/res.dart';
import 'package:network_app/utils/utils_locale.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreAvatarContainer extends StatelessWidget {
  const StoreAvatarContainer({
    Key? key,
    required this.currentNote,
    this.isViewCostume = false,
    this.isCupboard = false,
    required this.contHeight,
  }) : super(key: key);
  final Map<String, dynamic> currentNote;
  final bool isViewCostume;
  final bool isCupboard;
  final double? contHeight;

  @override
  Widget build(BuildContext context) {
    final clotheModel = ClotheModel.fromMap(currentNote);
    final mediaWidth = MediaQuery.of(context).size.width;
    final double contWidth =
        isViewCostume ? mediaWidth : mediaWidth * 0.8; //217.57
    // final double? imageHeight = isViewCostume ? contWidth * 0.65 : contWidth;
    // final double imageHeight = isViewCostume ? contWidth * 0.65 : contHeight!*0.65;
    // final double imageHeight = contHeight!*0.65;
    // final double pad = isViewCostume ? 30 : Res.s18;
    return InkWell(
      onTap: () {
        context.router.push(
          StoreProductViewRoute(
            clotheModel: clotheModel,
          ),
        );
      },
      child: AppContainer(
        padH: Res.s18,
        padV: Res.s20,
        radius: AppBorderRadius.r15,
        width: contWidth,
        height: contHeight??101.sp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                clotheModel.rare ? 'Rare' : 'Usual',
                style: AppTextStyles.primary16
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: AppContainer(
                // height: imageHeight,
                radius: AppBorderRadius.r10,
                color: Colors.transparent,
                child: clotheModel.imageUrl.isEmpty
                    ? Container()
                    : Image.network(clotheModel.imageUrl),
              ),
            ),
            SizedBox(
              height: Res.s12,
            ),

            SizedBox(
              // height: 42.sp,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clotheModel.title,
                    style: AppTextStyles.salad20
                        .copyWith(fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: Res.s15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        UtilsLocale.getLevelText(clotheModel.level, context),
                        style: AppTextStyles.primary16,
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      RhombusText(
                        tokens: clotheModel.tokens,
                        fontSize: Res.s16,
                      ),

                      // Text(
                      //   'Tokens +${clotheModel.tokens}',
                      //   style: AppTextStyles.primary,
                      // ),
                      // SizedBox(
                      //   width: Res.s10,
                      // ),
                      // Transform.translate(
                      //   offset: const Offset(-4, 0),
                      //   child: Icon(
                      //     NetworkIcons.rhombus,
                      //     color: AppColors.salad,
                      //     size: Res.s12, //15
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: Res.s15,
                  ),
                  if (isCupboard == false)
                    Text(
                      '${clotheModel.price} ETH',
                      style: AppTextStyles.salad16
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                ],
              ),
            ),

            // SizedBox(
            //   height: Res.s10,
            // ),
          ],
        ),
      ),
    );
  }
}

// class StoreAvatarContainer extends StatelessWidget {
//   const StoreAvatarContainer(
//       {Key? key,
//       required this.currentNote,
//       this.isViewCostume = false,
//         this.isCupboard = false,})
//       : super(key: key);
//   final Map<String, dynamic> currentNote;
//   final bool isViewCostume;
//   final bool isCupboard;
//
//
//   @override
//   Widget build(BuildContext context) {
//     final clotheModel = ClotheModel.fromMap(currentNote);
//     final isAvatarBody = clotheModel.type == 'body';
//     final mediaWidth = MediaQuery.of(context).size.width;
//     final double contWidth = isViewCostume ? mediaWidth : isAvatarBody? 65.sp : 55.sp; //217.57
//     final double contHeight = isViewCostume ? contWidth * 0.65 : contWidth;
//     final double pad = isViewCostume ? 30 : Res.s15;
//     return InkWell(
//       onTap: () {
//         context.router.push(
//           StoreProductViewRoute(
//             clotheModel: clotheModel,
//           ),
//         );
//       },
//       child: AppContainer(
//         padH: pad,
//         padV: pad,
//         radius: AppBorderRadius.r15,
//         width: contWidth,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Text(
//                 clotheModel.rare? 'Rare' : 'Usual',
//                 style:
//                     AppTextStyles.primary.copyWith(fontWeight: FontWeight.w600),
//                 textAlign: TextAlign.start,
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             AppContainer(
//                 height: contHeight,
//                 radius: AppBorderRadius.r10,
//                 color: Colors.transparent,
//                 child: clotheModel.imageUrl.isEmpty
//                     ? Container()
//                     : Image.network(clotheModel.imageUrl),
//                 ),
//             SizedBox(
//               height: Res.s12,
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   clotheModel.title,
//                   style: AppTextStyles.salad
//                       .copyWith(fontWeight: FontWeight.w600),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text('#${clotheModel.id}', style: AppTextStyles.primary12),
//                 SizedBox(
//                   height: 15.sp, //29
//                 ),
//
//                 if(isCupboard==false)
//                 Text(
//                   '${clotheModel.price} ETH',
//                   style: AppTextStyles.salad16
//                       .copyWith(fontWeight: FontWeight.w600),
//                 ),
//
//                 SizedBox(
//                   height: isCupboard? Res.s32 : Res.s14,
//                 ),
//
//                 if (isAvatarBody)
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         UtilsLocale.getLevelText(clotheModel.level, context),
//                         style: AppTextStyles.primary12,
//                       ),
//                       const SizedBox(
//                         width: 5,
//                       ),
//                       Text(
//                         'Tokens +${clotheModel.tokens}',
//                         style: AppTextStyles.primary12,
//                       ),
//                       SizedBox(
//                         width: Res.s10,
//                       ),
//                       Transform.translate(
//                         offset: const Offset(-4, 0),
//                         child: Icon(
//                           NetworkIcons.rhombus,
//                           color: AppColors.salad,
//                           size: Res.s12, //15
//                         ),
//                       ),
//                     ],
//                   )
//                 else
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         // 'Уровень ${clotheModel.level}',
//                         UtilsLocale.getLevelText(clotheModel.level, context),
//                         style: AppTextStyles.primary12,
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             'Tokens +${clotheModel.tokens}',
//                             style: AppTextStyles.primary12,
//                           ),
//                           SizedBox(
//                             width: Res.s10,
//                           ),
//                           Transform.translate(
//                             offset: const Offset(-4, 0),
//                             child: Icon(
//                               NetworkIcons.rhombus,
//                               color: AppColors.salad,
//                               size: Res.s12, //15
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )
//
//                 // Wrap(
//                 //   spacing: Res.s10,
//                 //   children: [
//                 //     Text(
//                 //       'Уровень ${clotheModel.level}  Баллы +${clotheModel.points}',
//                 //       style: AppTextStyles.primary12,
//                 //     ),
//                 //     Transform.translate(
//                 //       offset: const Offset(-4, 0),
//                 //       child: Icon(
//                 //         NetworkIcons.rhombus,
//                 //         color: AppColors.salad,
//                 //         size: Res.s12, //15
//                 //       ),
//                 //     ),
//                 //   ],
//                 // ),
//
//                 // SizedBox(
//                 //   height: Res.s12,
//                 // ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
