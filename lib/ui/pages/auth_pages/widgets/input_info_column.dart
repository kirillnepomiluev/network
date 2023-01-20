import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';

class InputInfoColumn extends StatelessWidget {
  const InputInfoColumn({
    Key? key, required this.text1, required this.text2, required this.description, required this.onContinue,
  }) : super(key: key);
  final String text1;
  final String text2;
  final String description;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AuthBarRow(),
        EnterInfoContainer(
          text1: text1,
          text2: text2,
          description: description,
        ),
        const SizedBox(
          height: 36,
        ),
        const AppTextField(),
        const SizedBox(
          height: 36,
        ),
        AppButtonContinue(onPressed: onContinue),
      ],
    );
  }
}
