import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/utils/responsive_utils.dart';

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
      fontSize: ResponsiveUtils.getResSize(14),
      fontWeight: FontWeight.w400,
      color: AppColors.textWhite
  );

  static final blackPrimary = primary.copyWith(
    color: AppColors.textBlack,
  );
  
  // static final blackPrimary16 = blackPrimary.copyWith(
  //   fontSize: 16,
  // );
  

  static final primary16 = primary.copyWith(fontSize: ResponsiveUtils.getResSize(16));

  static final primary20w5 = primary.copyWith(
      fontSize: ResponsiveUtils.getResSize(24), //24
      fontWeight: FontWeight.w500
  );

  static final white32w6 = TextStyle(
    // fontSize: 23.5.sp, //34
      fontSize: ResponsiveUtils.getResSize(32), //34
      color: Colors.white,
      fontWeight: FontWeight.w600
  );

  //////////////////////////////////////

  static final primary18w5 = primary.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: ResponsiveUtils.getResSize(18), //1
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
    fontSize: ResponsiveUtils.getResSize(10),
  );

  static final gray12b = grayPrimaryBold.copyWith(
      fontSize: ResponsiveUtils.getResSize(12),
  );


  /////////////////////////////////////////

  static final saladPrimary = primary.copyWith(
    color: AppColors.salad100
  );

  static final salad24 = saladPrimary.copyWith(
        fontSize: ResponsiveUtils.getResSize(24), //24
        fontWeight: FontWeight.w600
  );



}
