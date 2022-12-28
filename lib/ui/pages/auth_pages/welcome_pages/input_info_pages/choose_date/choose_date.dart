import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_date_rich_text.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';

class ChooseDatePage extends StatefulWidget {
  const ChooseDatePage({Key? key}) : super(key: key);

  @override
  State<ChooseDatePage> createState() => _ChooseDatePageState();
}

class _ChooseDatePageState extends State<ChooseDatePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const BackButtonCustom(),

                EnterInfoContainer(
                  padTop: 32,
                  text1: '${AppString.of(context).input} ',
                  text2: AppString.of(context).ofBirthDay,
                  description: AppString.of(context).youCanHideYourAge,
                ),

                const SizedBox(
                  height: 40,
                ),

                const ChooseDateRichText(),

                const SizedBox(
                  height: 45,
                ),

                ButtonContinue(onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => const ChooseSexPage()));
                }),

                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                    width: 190,
                    child: CustomCheckListTile(
                      title: AppString.of(context).hideAge,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
