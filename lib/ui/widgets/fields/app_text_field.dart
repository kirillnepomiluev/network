import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.primary16,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(AppBorderRadius.r20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(AppBorderRadius.r20)),
          // hintText: 'Введите адрес электронной почты',
          hintStyle:
          AppTextStyles.primary16,
      ),
    );
  }
}
