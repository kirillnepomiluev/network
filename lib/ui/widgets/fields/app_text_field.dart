import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_input_border.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool isTransparent;
  final bool autofocus;
  final bool enabled;
  final String hintText;
  const AppTextField(
      {Key? key,
      this.controller,
      this.isTransparent = false,
      this.autofocus = false,
      this.hintText = '',
        this.enabled = true
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      style: AppTextStyles.primary16,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      autofocus: autofocus,
      initialValue: hintText,
      maxLines: null,
      decoration: isTransparent
          ? null
          : AppInputBorder.inputDecoration
    );
  }
}
