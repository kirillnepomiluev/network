import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/button_trouble_enter.dart';
import 'package:network_app/ui/pages/auth_pages/widgets/network_row.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/ui/widgets/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginMultiplePage extends StatefulWidget {
  const LoginMultiplePage({Key? key}) : super(key: key);

  @override
  State<LoginMultiplePage> createState() => _LoginMultiplePageState();
}

class _LoginMultiplePageState extends State<LoginMultiplePage> {
  double mediaWitdh = 0;
  double mediaHeight = 0;

  @override
  Widget build(BuildContext context) {
    mediaHeight = MediaQuery.of(context).size.height;
    mediaWitdh = MediaQuery.of(context).size.width;
    return
      Scaffold(
        body: SafeArea(
          child: Stack(
            children: [

              Positioned(
                  bottom: 17.sp, //5
                  right: 17.sp, //10
                  child: const ButtonTroubleEnter()
              ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 65),
                      child: NetworkRow(isRow: true, opacity: 0.0),
                    )),

                // _enterInfo(),
                const EnterInfoContainer(
                  padTop: 42,
                  text1: 'Выполните ',
                  text2: 'вход',
                  maxLines: 3,
                ),

                Padding(
                  padding: EdgeInsets.only(top: 30.sp //57
                  ),
                  child: const EnterRowContainer(
                    icon: NetworkIcons.call,
                    title: 'Войти по номеру телефона',
                    // leftPad: 24.sp   //30
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 21 //57
                  ),
                  child: EnterRowContainer(
                    icon: Icons.email,
                    title: 'Войти с помошью почты',
                    // leftPad: 24.sp   //30
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 21),
                  child: EnterRowContainer(
                    iconName: 'logo_google',
                    title: 'Войти через Google',
                    // leftPad: 23.sp   //28
                  ),
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 21),
                  child: EnterRowContainer(
                    iconName: 'logo_facebook',
                    title: 'Войти через Facebook',
                    // leftPad: 23.sp   //28
                  ),
                ),
              ],
            )
          )

            ],
          ),
        ),
      );
  }

}






