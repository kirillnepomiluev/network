import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:network_app/ui/theme/app_input_border.dart';


class InputPhoneField extends StatelessWidget {
  final Function(PhoneNumber) onChange;
  final GlobalKey formstate;
  const InputPhoneField(
      {Key? key, required this.formstate, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: SizedBox(
          height: 80,
          child: IntlPhoneField(
            dropdownIcon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            autofocus: false,
            // AppTextStyles.primary,
            // dropdownTextStyle:const TextStyle(color: Colors.white, fontSize: 14),
            // style: const TextStyle(fontSize: 14, color: Colors.white),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            initialCountryCode: 'RU',
            decoration: AppInputBorder.inputDecoration,
            onChanged: onChange,
          )),
    );
  }
}
