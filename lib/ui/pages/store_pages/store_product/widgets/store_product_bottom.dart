import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:auto_route/auto_route.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';


class StoreProductBottom extends StatelessWidget {
  const StoreProductBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 50,
      width: MediaQuery.of(context).size.width,
      height: 105,
      color: AppColors.black1A.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 37), //30
            child: Text(
              '1.6 SOL',
              style: AppTextStyles.salad16.copyWith(fontWeight: FontWeight.w600)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child:
            AppButton(
              width: 200,
              onPressed: () {
                DialogUtils.openBottomSheetInfoWithIcon(
                    context: context,
                    icon: NetworkIcons.check_circle_outlined,
                    text1: 'Оплата прошла ',
                    text2: 'успешно',
                    text3: 'Новый головной убор вы можете\nнайти в своем шкафу',
                    textButton: 'Перейти в шкаф',
                  func: (){
                    context.router.pop();
                    context.router.push(
                        HomeViewRoute(initIndex: 1, isCupboard: true));
                  }
                );

              },
              text: 'Купить сейчас',
            )

          )
        ],
      ),
    );
  }
}

// void openSuccessSheet({
//   required BuildContext context,
// }) {
//   showModalBottomSheet<void>(
//       barrierColor: Colors.transparent,
//       backgroundColor: AppColors.black1A.withOpacity(0.5),
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//       context: context,
//       builder: (BuildContext context) => BlurryContainer(
//         blur: 60,
//         color: Colors.black.withOpacity(0.5),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(top: 70),
//                 child: Icon(
//                   NetworkIcons.check_circle_outlined,
//                   size: 100,
//                   color: AppColors.salad,
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 60),
//                 child: RichTextTwo(
//                   text1: 'Оплата прошла ',
//                   text2: 'успешно',
//                   // fontSize: 20,
//                   fontWeight1: FontWeight.w400,
//                   fontWeight2: FontWeight.w700,
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 60),
//                 child: Text(
//                   'Новый головной убор вы можете\nнайти в своем шкафу',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white),
//                 ),
//               ),
//               Padding(
//                   padding: const EdgeInsets.only(top: 150, bottom: 20),
//                   child: AppButton(
//                       onPressed: () {
//                         context.router.push(
//                             HomeViewRoute(initIndex: 1, isCupboard: true));
//                       },
//                       text: 'Перейти в шкаф')),
//             ],
//           ),
//         ),
//       ));
// }
