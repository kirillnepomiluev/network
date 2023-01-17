import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/utils/utils_responsive.dart';

class AppInputBorder{

  static final _defaultBorder = OutlineInputBorder(
      borderSide: const BorderSide(width: 1, color: AppColors.salad),
      borderRadius: BorderRadius.circular(AppBorderRadius.r20));


  static final inputDecoration = InputDecoration(
    contentPadding:
    EdgeInsets.symmetric(
        vertical: UtilsResponsive.getResSize(22),
        horizontal: UtilsResponsive.getResSize(16)
    ),
    focusedBorder: _defaultBorder,
    enabledBorder: _defaultBorder,
    disabledBorder: _defaultBorder,
    hintStyle: AppTextStyles.primary16,
  );

}