import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/widgets/choose_date_rich_text.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_continue.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_check_list_tile.dart';


class ChooseBirthDateView extends StatefulWidget {
  const ChooseBirthDateView({Key? key}) : super(key: key);

  @override
  State<ChooseBirthDateView> createState() => _ChooseBirthDateViewState();
}

class _ChooseBirthDateViewState extends State<ChooseBirthDateView> {
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
                const AppBackButton(),

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
                  context.router.push(const ChooseSexViewRoute());
                }),

                const SizedBox(
                  height: 30,
                ),

                SizedBox(
                    width: 190,
                    child: AppCheckListTile(
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
