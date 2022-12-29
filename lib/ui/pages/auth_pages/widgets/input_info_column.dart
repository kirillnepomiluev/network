import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';

class InputInfoColumn extends StatelessWidget {
  final String text1;
  final String text2;
  final String description;
  final VoidCallback onContinue;
  const InputInfoColumn({
    Key? key, required this.text1, required this.text2, required this.description, required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AuthBarRow(),
        EnterInfoContainer(
          padTop: 32,
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
        ButtonContinue(onPressed: onContinue),
      ],
    );
  }
}
