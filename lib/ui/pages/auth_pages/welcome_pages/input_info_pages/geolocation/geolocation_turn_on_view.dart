import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';


class GeolocationTurnOnView extends StatelessWidget {
  const GeolocationTurnOnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const AuthBarRow(),
                EnterInfoContainer(
                  text1: '${AppString.of(context).turnOn} ',
                  text2: AppString.of(context).ofGeolocation,
                  description: '${AppString.of(context).metPeopleNear}\n\n${AppString.of(context).yourLocationWillBeUsed}',
                ),
                const SizedBox(height: 40,),
                AppButton(onPressed: (){
                  context.router.pushAndPopUntil(HomeViewRoute(initIndex: 0), predicate: (route) => false);
                }, text: 'Включить геолокацию')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
