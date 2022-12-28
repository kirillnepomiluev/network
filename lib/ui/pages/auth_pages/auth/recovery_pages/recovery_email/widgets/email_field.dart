import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.primary16,
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 22, horizontal: 16),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          hintText: AppString.of(context).inputEmailAddress,
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray)),
    );
  }
}
