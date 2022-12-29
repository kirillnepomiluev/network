import 'package:flutter/material.dart';
import 'package:network_app/generated/l10n.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/auth_bar_row.dart';
import 'package:network_app/ui/pages/home/home_page.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TurnOnLocationPage extends StatelessWidget {
  const TurnOnLocationPage({Key? key}) : super(key: key);

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
                  padTop: 32,
                  text1: '${AppString.of(context).turnOn} ',
                  text2: AppString.of(context).ofGeolocation,
                  description: '${AppString.of(context).metPeopleNear}\n\n${AppString.of(context).yourLocationWillBeUsed}',
                  // description: 'Знакомьтесь и встречайтесь\nс людьми рядом с вами\n\nВаше местоположение будет использовано для показа потенциальных партнеров для встреч',
                  // description: AppString.of(context).yourLocationWillBeUsed,
                ),
                SizedBox(height: 40,),
                AppButton(onPressed: (){
                  Route route = MaterialPageRoute<void>(builder: (context) => const HomePage(initIndex: 0));
                  Navigator.pushAndRemoveUntil<void>(context, route, (route) => false);
                }, text: 'Включить геолокацию')
                // Padding(
                //   padding: const EdgeInsets.only(top: 40),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: ElevatedButton(
                //         style: buttonStyleCustom(
                //             color: Colors.white, padH: 0, padV: 22, radius: 20),
                //         onPressed: () {
                //
                //           Route route = MaterialPageRoute<void>(builder: (context) => const HomePage(initIndex: 0));
                //           Navigator.pushAndRemoveUntil<void>(context, route, (route) => false);
                //
                //         },
                //         child: Text(
                //           'Включить геолокацию',
                //           style: TextStyle(
                //               fontSize: 18.5.sp, //18
                //               fontWeight: FontWeight.w500,
                //               color: Colors.black),
                //         )),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
