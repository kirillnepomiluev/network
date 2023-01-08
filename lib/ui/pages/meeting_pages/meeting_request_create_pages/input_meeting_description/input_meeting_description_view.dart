import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/widgets/buttons/button_continue.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/app_bar_row.dart';
import 'package:network_app/ui/widgets/fields/app_text_field.dart';


class InputDescriptionMeetingView extends StatelessWidget {
  const InputDescriptionMeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                AppBarRow(
                  title: AppString.of(context).creatingOfPersonalRequest,
                ),

                EnterInfoContainer(
                  padTop: 32,
                  text1: '${AppString.of(context).shortlyDescribe} ',
                  text2: AppString.of(context).whatMeetingAreYouPlaning,
                  description: 'Здесь будет небольшое описание, что именно здесь нужно указать',
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 36, bottom: 62),
                  child:
                    AppTextField(isTransparent: true,),
                ),

                AppButtonContinue(onPressed: (){
                  FocusManager.instance.primaryFocus?.unfocus();
                  context.router.push(const ChooseMeetingOccupationsViewRoute());
                }),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
