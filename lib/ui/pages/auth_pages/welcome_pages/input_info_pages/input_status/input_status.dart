import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_occupation/choose_occupation.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';


class InputStatusPage extends StatelessWidget {
  const InputStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child:
            InputInfoColumn(
              text1: '${AppString.of(context).inputOwn} ',
              text2: AppString.of(context).status,
              description: AppString.of(context).statusWillShowenInYourProfile,
              onContinue: (){
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => const ChooseOccupationPage()));
              },
            ),
          ),
        ),
      ),
    );
  }
}
