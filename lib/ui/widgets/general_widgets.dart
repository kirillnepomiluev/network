import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';


Widget textField(String hintText, {bool isEnable = true}) => Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        enabled: isEnable,
        maxLines: null,
        style: const TextStyle(
            fontSize: 18, //18
            fontWeight: FontWeight.w400,
            color: Colors.white),
        initialValue: hintText,
        autofocus: false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: AppColors.salad100),
              borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );


ButtonStyle buttonStyleCustom({
  double padH = 61,
  double padV = 17,
  double radius = 52,
  Color color = Colors.white,
}) =>
    ButtonStyle(
      padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: padV, horizontal: padH)),
      backgroundColor: MaterialStateProperty.all(color),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );