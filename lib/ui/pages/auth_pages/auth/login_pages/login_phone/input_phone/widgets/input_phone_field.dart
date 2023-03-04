import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:network_app/ui/theme/app_input_border.dart';


class InputPhoneField extends StatelessWidget {
  const InputPhoneField(
      {Key? key, required this.formstate, required this.onChange, required this.showErrorText,})
      : super(key: key);
  final bool showErrorText;
  final Function(PhoneNumber) onChange;
  final GlobalKey formstate;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      child: Container(
          padding: const EdgeInsets.all(8),
          height: 100,
          child: IntlPhoneField(
            dropdownIcon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            initialCountryCode: 'PH',
            textAlignVertical: TextAlignVertical.center,
            decoration: AppInputBorder.inputPhoneDecorationBorder,
            invalidNumberMessage: showErrorText? 'Неправильный формат' : ' ',
            // initialValue: '960379358',

            onChanged: onChange,
          ),),
    );
  }
}
