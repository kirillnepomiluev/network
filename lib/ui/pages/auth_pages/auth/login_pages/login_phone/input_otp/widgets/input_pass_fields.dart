import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputPassFields extends StatelessWidget {
  final String? Function(String?) onValidation;
  final void Function(String) onComplete;
  const InputPassFields(
      {Key? key, required this.onValidation, required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: _defaultPinTheme,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      validator: onValidation,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      textInputAction: TextInputAction.next,
      showCursor: true,
      onCompleted: onComplete,
    );
  }
}

final _defaultPinTheme = PinTheme(
  width: 32.sp, //62
  height: 32.sp,
  textStyle: AppTextStyles.primary16.copyWith(fontWeight: FontWeight.w500),
  decoration: BoxDecoration(
    color: Colors.transparent,
    border: Border.all(width: 1, color: AppColors.salad),
    borderRadius: BorderRadius.circular(20),
  ),
);
