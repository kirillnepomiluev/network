import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/utils/utils_responsive.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoreProductBottom extends StatelessWidget {
  const StoreProductBottom({
    Key? key, required this.buyClothe, required this.cost,
  }) : super(key: key);

  final VoidCallback buyClothe;
  final double cost;

  @override
  Widget build(BuildContext context) {

    return BlurryContainer(
      blur: 50,
      width: MediaQuery.of(context).size.width,
      color: AppColors.black1A.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: Res.s12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: Res.s35), //30
            child: Text('$cost SOL',
                style: AppTextStyles.salad16
                    .copyWith(fontWeight: FontWeight.w600),),
          ),
          Padding(
              padding: EdgeInsets.only(right: Res.s15),
              child: AppButton(
                width: 60.sp, //180
                height: 32.sp,   //50
                textStyle: AppTextStyles.black,
                borderRadius: AppBorderRadius.r15,
                onPressed: buyClothe,
                text: 'Купить сейчас',
              ),)
        ],
      ),
    );
  }
}