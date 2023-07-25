import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_input_border.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {Key? key,
      this.controller,
      this.isTransparent = false,
      this.autofocus = false,
      this.initialValue,
        this.enabled = true,
        this.labelText,
        this.obscureText = false,
        this.onChanged,
      })
      : super(key: key);
  final TextEditingController? controller;
  final bool isTransparent;
  final bool autofocus;
  final bool enabled;
  final bool obscureText;
  final String? initialValue;
  final String? labelText;
  final Function(String? newValue)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      // initialValue: initialValue,
      // style: AppTextStyles.primary,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      onChanged: onChanged,
      autofocus: autofocus,
      maxLines: obscureText? 1 : null,
      obscureText: obscureText,
      decoration: isTransparent
          ? AppInputBorder.inputDecorationTransparent
          : AppInputBorder.inputDecorationBorder.copyWith(
        labelText: labelText,
        labelStyle: AppTextStyles.grey
      ),
    );
  }
}
