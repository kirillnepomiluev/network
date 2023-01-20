import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/main_pages/dialog_utls.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreProductBottom extends StatelessWidget {
  const StoreProductBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurryContainer(
      blur: 50,
      width: MediaQuery.of(context).size.width,
      color: AppColors.black1A.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: UtilsResponsive.getResSize(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: UtilsResponsive.getResSize(35)), //30
            child: Text('1.6 SOL',
                style: AppTextStyles.salad16
                    .copyWith(fontWeight: FontWeight.w600),),
          ),
          Padding(
              padding: EdgeInsets.only(right: UtilsResponsive.getResSize(15)),
              child: AppButton(
                width: 60.sp, //180
                height: 32.sp,   //50
                textStyle: AppTextStyles.black,
                borderRadius: AppBorderRadius.r15,
                onPressed: () {
                  DialogUtils.openBottomSheetInfoWithIcon(
                      context: context,
                      icon: NetworkIcons.check_circle_outlined,
                      text1: 'Оплата прошла ',
                      text2: 'успешно',
                      text3:
                          'Новый головной убор вы можете\nнайти в своем шкафу',
                      textButton: 'Перейти в шкаф',
                      func: () {
                        context.router.pop();
                        context.router.push(
                            HomeViewRoute(initIndex: 1, isCupboard: true),);
                      },);
                },
                text: 'Купить сейчас',
              ),)
        ],
      ),
    );
  }
}