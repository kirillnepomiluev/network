import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';


class AppTheme{
  static final mainTheme = ThemeData(
      unselectedWidgetColor: AppColors.salad,
      fontFamily: 'Inter',
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
              ),
          ),
      ),
      appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
      textTheme: AppTextStyles.textTheme,
      scaffoldBackgroundColor: AppColors.blackBack,
  );
}