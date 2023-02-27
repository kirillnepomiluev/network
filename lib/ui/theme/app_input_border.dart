import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/utils_responsive.dart';

class AppInputBorder {
  static final _defaultBorder = OutlineInputBorder(

      borderSide: const BorderSide(color: AppColors.salad),
      borderRadius: BorderRadius.circular(AppBorderRadius.r20),);

  static final inputDecorationBorder = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
        vertical: Res.s22,
        horizontal: Res.s16,),
    // contentPadding: EdgeInsets.zero,
    focusedBorder: _defaultBorder,
    enabledBorder: _defaultBorder,
    disabledBorder: _defaultBorder,
    hintStyle: AppTextStyles.primary,
    labelStyle: AppTextStyles.primary,
  );

  /////////////////////////////////////////////////
  static const _transBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
    // borderRadius: BorderRadius.circular(AppBorderRadius.r20)
  );

  static final inputDecorationTransparent = InputDecoration(
    // contentPadding: EdgeInsets.symmetric(
    //     vertical: UtilsRes.s22,
    //     horizontal: UtilsRes.s16,),
    contentPadding: EdgeInsets.zero,
    focusedBorder: _transBorder,
    enabledBorder: _transBorder,
    disabledBorder: _transBorder,
    hintStyle: AppTextStyles.primary,
    labelStyle: AppTextStyles.primary,
  );


  /////////////////////////////////////////////////

  static const _phoneBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),);
  // OutlineInputBorder(
  //     borderSide: const BorderSide(width: 1, color: AppColors.salad),
  //     borderRadius: BorderRadius.circular(AppBorderRadius.r20)
  // );

  static final inputPhoneDecorationBorder = InputDecoration(
    focusedBorder: _phoneBorder,
    enabledBorder: _phoneBorder,
    disabledBorder: _phoneBorder,
    border: _phoneBorder,
    errorBorder: _phoneBorder,
    focusedErrorBorder: _phoneBorder,
    hintStyle: AppTextStyles.primary,
    labelStyle: AppTextStyles.primary,
  );
}
