import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/utils_responsive.dart';

class AppTextStyles {

  static final TextTheme textTheme = TextTheme(
    headline1: primary,
    headline2: primary,
    headline3: primary,
    headline4: primary,
    headline5: primary,
    bodyText1: primary,
    bodyText2: primary,
    subtitle1: primary,
    subtitle2: primary,
    button: primary,
    caption: primary,
  );

  static final primary = GoogleFonts.inter(
      fontSize: UtilsResponsive.getResSize(14),
      fontWeight: FontWeight.w400,
      color: AppColors.textWhite
  );

  static final primary10 = primary.copyWith(fontSize: UtilsResponsive.getResSize(10));
  static final primary12 = primary.copyWith(fontSize: UtilsResponsive.getResSize(12));
  static final primary16 = primary.copyWith(fontSize: UtilsResponsive.getResSize(16));
  static final primary18 = primary.copyWith(fontSize: UtilsResponsive.getResSize(18));
  static final primary20 = primary.copyWith(fontSize: UtilsResponsive.getResSize(20));
  static final primary22 = primary.copyWith(fontSize: UtilsResponsive.getResSize(22));
  static final primary26 = primary.copyWith(fontSize: UtilsResponsive.getResSize(26));
  static final primary32 = primary.copyWith(fontSize: UtilsResponsive.getResSize(32));
  static final primary38 = primary.copyWith(fontSize: UtilsResponsive.getResSize(38));

  static final black = primary.copyWith(color: AppColors.textBlack,);
  static final black11 = black.copyWith(fontSize: UtilsResponsive.getResSize(11));
  static final black12 = black.copyWith(fontSize: UtilsResponsive.getResSize(12));

  static final grey = primary.copyWith(color: AppColors.textGray,);
  static final grey10 = grey.copyWith(fontSize: UtilsResponsive.getResSize(10));
  static final grey12 = grey.copyWith(fontSize: UtilsResponsive.getResSize(12));

  static final salad = primary.copyWith(color: AppColors.salad);
  static final salad10 = salad.copyWith(fontSize: UtilsResponsive.getResSize(10),);
  static final salad16 = salad.copyWith(fontSize: UtilsResponsive.getResSize(16),);
  static final salad20 = salad.copyWith(fontSize: UtilsResponsive.getResSize(20),);
  static final salad24 = salad.copyWith(fontSize: UtilsResponsive.getResSize(24),);

  static final darkSalad = primary.copyWith(color: AppColors.darkSalad);

}
