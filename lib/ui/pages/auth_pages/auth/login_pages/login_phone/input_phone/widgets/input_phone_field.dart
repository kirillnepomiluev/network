import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:network_app/ui/theme/app_colors.dart';


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
            dropdownTextStyle:
            const TextStyle(color: Colors.white, fontSize: 14),
            style: const TextStyle(fontSize: 14, color: Colors.white),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            initialCountryCode: 'RU',
            decoration: InputDecoration(
              // contentPadding: const EdgeInsets.only(top: 25, bottom: 24),
              contentPadding: const EdgeInsets.only(top: 22, bottom: 24),
              border: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1, color: AppColors.salad100),
                  borderRadius: BorderRadius.circular(20)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1, color: AppColors.salad100),
                  borderRadius: BorderRadius.circular(20)),
              enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(width: 1, color: AppColors.salad100),
                  borderRadius: BorderRadius.circular(20)),
            ),
            onChanged: onChange,
          )),
    );
  }
}
