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

  static final blackPrimary = primary.copyWith(
    color: AppColors.textBlack,
  );

  static final black12w5 = TextStyle(
    color: AppColors.textBlack,
    fontSize: UtilsResponsive.getResSize(12),
    fontWeight: FontWeight.w500
  );

  // static final blackPrimary16 = blackPrimary.copyWith(
  //   fontSize: 16,
  // );
  

  static final primary10 = primary.copyWith(fontSize: UtilsResponsive.getResSize(10));
  static final primary12 = primary.copyWith(fontSize: UtilsResponsive.getResSize(12));

  static final primary16 = primary.copyWith(fontSize: UtilsResponsive.getResSize(16));

  static final primary20w5 = primary.copyWith(
      fontSize: UtilsResponsive.getResSize(24), //24
      fontWeight: FontWeight.w500
  );

  static final primary26w7 = primary.copyWith(
      fontSize: UtilsResponsive.getResSize(26), //24
      fontWeight: FontWeight.w700
  );

  static final primary22w6 = primary.copyWith(
        fontSize: UtilsResponsive.getResSize(22), //22
        fontWeight: FontWeight.w600
  );

  static final white32w6 = TextStyle(
    // fontSize: 23.5.sp, //34
      fontSize: UtilsResponsive.getResSize(32), //34
      color: Colors.white,
      fontWeight: FontWeight.w600
  );

  //////////////////////////////////////

  static final primary18w5 = primary.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: UtilsResponsive.getResSize(18), //1
  );

  // fontWeight: FontWeight.w500,
  // fontSize: ResponsiveUtils.getResSize(18), //18
  // color: textColor

  static final grayPrimary = primary.copyWith(
    color: AppColors.textGray,
  );

  static final grayPrimary500 = grayPrimary.copyWith(
      fontWeight: FontWeight.w500
  );

  static final grayPrimaryBold = grayPrimary.copyWith(
      fontWeight: FontWeight.bold
  );

  static final gray10b = grayPrimaryBold.copyWith(
    fontSize: UtilsResponsive.getResSize(10),
  );

  static final gray12b = grayPrimaryBold.copyWith(
      fontSize: UtilsResponsive.getResSize(12),
  );


  /////////////////////////////////////////

  static final saladPrimary = primary.copyWith(
    color: AppColors.salad100
  );

  static final saladPrimary10 = saladPrimary.copyWith(
      fontSize: UtilsResponsive.getResSize(10), //24
  );

  static final salad24 = saladPrimary.copyWith(
        fontSize: UtilsResponsive.getResSize(24), //24
        fontWeight: FontWeight.w600
  );

  static final darkSaladPrimary = primary.copyWith(
      color: AppColors.darkSalad
  );

  static final darkSalad14w5 =
  darkSaladPrimary.copyWith(
      fontWeight: FontWeight.w500
  );


}
