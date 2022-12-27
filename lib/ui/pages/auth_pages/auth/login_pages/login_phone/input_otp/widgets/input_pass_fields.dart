import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputPassFields extends StatelessWidget {
  final String? Function(String?) onValdation;
  final void Function(String) onComplete;
  const InputPassFields(
      {Key? key, required this.onValdation, required this.onComplete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Pinput(
      defaultPinTheme: _defaultPinTheme,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      validator: onValdation,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      textInputAction: TextInputAction.next,
      showCursor: true,
      onCompleted: onComplete,
    );
  }
}

final _defaultPinTheme = PinTheme(
  width: 34.sp, //62
  height: 34.sp,
  textStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.sp, //24
      fontWeight: FontWeight.w500),
  decoration: BoxDecoration(
    color: Colors.transparent,
    border: Border.all(width: 1, color: ConstColor.salad100),
    borderRadius: BorderRadius.circular(20),
  ),
);