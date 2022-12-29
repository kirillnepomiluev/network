import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_border_radius.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

final _defaultBorder = OutlineInputBorder(
    borderSide: const BorderSide(
        width: 1, color: AppColors.salad100),
    borderRadius: BorderRadius.circular(AppBorderRadius.r20));


class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isTransparent;
  final bool autofocus;
  const AppTextField({Key? key, this.controller, this.isTransparent = false, this.autofocus = false}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: AppTextStyles.primary16,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      autofocus: autofocus,
      decoration:
      isTransparent? null :
      InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
          focusedBorder: _defaultBorder,
          enabledBorder: _defaultBorder,
          // hintText: 'Введите адрес электронной почты',
          hintStyle: AppTextStyles.primary16,
      ),
    );
  }
}

