import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/input_info_column.dart';

class InputAboutYouView extends StatelessWidget {
  const InputAboutYouView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child:

            InputInfoColumn(
              text1: '${AppString.of(context).tell} ',
              text2: AppString.of(context).aboutYou,
              description: AppString.of(context).thisInfoWillBeShowedInProfile,
              onContinue: (){
                FocusManager.instance.primaryFocus?.unfocus();
                context.router.push(const GeolocationTurnOnViewRoute());

              },
            ),
          ),
        ),
      ),
    );
  }
}
