import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';

class ButtonContinue extends StatelessWidget {
  final VoidCallback onPressed;
  const ButtonContinue({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(onPressed: onPressed, text: AppString.of(context).toContinue);
  }
}
