import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';

class InputMeetingOccupationView extends StatefulWidget {
  const InputMeetingOccupationView({Key? key}) : super(key: key);

  @override
  State<InputMeetingOccupationView> createState() => _InputMeetingOccupationViewState();
}

class _InputMeetingOccupationViewState extends State<InputMeetingOccupationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child:

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarRow(title: AppString.of(context).creatingOfPersonalRequest),
                EnterInfoContainer(
                  padTop: 32,
                  text1: '${AppString.of(context).input} ',
                  text2: AppString.of(context).ownOption,
                  description: AppString.of(context).occupationsWillBeShowedInProfile,
                ),
                const SizedBox(
                  height: 36,
                ),
                const AppTextField(),
                const SizedBox(
                  height: 36,
                ),
                AppButtonContinue(onPressed: (){
                  FocusManager.instance.primaryFocus?.unfocus();
                  // context.router.push(const ChooseMeetingInterestsViewRoute());
                  context.router.pop();
                },),
              ],
            )

          ),
        ),
      ),
    );
  }
}
