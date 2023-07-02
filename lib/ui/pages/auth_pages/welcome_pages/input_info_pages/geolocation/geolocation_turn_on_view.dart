import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/utils/utils_geo.dart';
import 'package:provider/provider.dart';



class GeolocationTurnOnView extends StatelessWidget {
  const GeolocationTurnOnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userNotifier = Provider.of<UserNotifier>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthBarRow(
                  onSkip: (){
                    // userNotifier.firstUpdateData();
                    userNotifier.setUserDataFunc();
                    context.router.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false);
                  },
                ),
                EnterInfoContainer(
                  text1: '${AppString.of(context).turnOn} ',
                  text2: AppString.of(context).ofGeolocation,
                  description: '${AppString.of(context).metPeopleNear}\n\n${AppString.of(context).yourLocationWillBeUsed}',
                ),
                const SizedBox(height: 40,),
                AppButton(onPressed: () async {

                  // final Position? position = await UtilsGeo.getCurrentLocation(context);
                  //
                  // if(position!=null){
                  //   final lat = position.latitude;
                  //   final long = position.longitude;
                  //
                  //   print('lat $lat long $long');
                  //
                  //   UtilsGeo.liveLocation(context);
                  //
                  //   //     'location': 'POINT(48.4401995 53.138915)',           //long lat
                  //
                  //   userNotifier.updateData(newData: {
                  //     'lat' : lat,
                  //     'long' : long,
                  //     'location' : 'POINT($lat $long)'
                  //   });
                  //   // UserNotifier().updateData(newData: newData)
                  //
                  // }

                  final success = await UtilsGeo.liveLocation(context);
                  print('success $success');

                  if(success){
                    // userNotifier.firstUpdateData();
                    userNotifier.setUserDataFunc();
                    context.router.pushAndPopUntil(HomeViewRoute(), predicate: (route) => false);
                  }

                }, text: '${AppString.of(context).turnOn} ${AppString.of(context).ofGeolocation}',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
