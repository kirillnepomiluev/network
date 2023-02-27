import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';

class AppButtonContinue extends StatelessWidget {
  const AppButtonContinue({Key? key, this.onPressed,}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
        onPressed: onPressed, text: AppString.of(context).toContinue,);
  }
}
