import 'package:flutter/material.dart';
import 'package:network_app/constants.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      textInputAction: TextInputAction.done,
      cursorColor: Colors.white,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 22, horizontal: 16),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                  width: 1, color: ConstColor.salad100),
              borderRadius: BorderRadius.circular(20)),
          hintText: 'Введите адрес электронной почты',
          hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: ConstColor.textGray)),
    );
  }
}
