import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/input_about_you/input_about_you.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';

class InputOccupationPage extends StatefulWidget {
  const InputOccupationPage({Key? key}) : super(key: key);

  @override
  State<InputOccupationPage> createState() => _InputOccupationPageState();
}

class _InputOccupationPageState extends State<InputOccupationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: InputInfoColumn(
              text1: '${AppString.of(context).input} ',
              text2: AppString.of(context).ownOption,
              description: AppString.of(context).occupationsWillBeShowedInProfile,
              onContinue: (){
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => const InputAboutYouPage()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
