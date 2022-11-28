import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginSecondPage extends StatefulWidget {
  const LoginSecondPage({Key? key}) : super(key: key);

  @override
  State<LoginSecondPage> createState() => _LoginSecondPageState();
}

class _LoginSecondPageState extends State<LoginSecondPage> {
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
                  child: troubleEnter(context)
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

  // Widget enterContainer({
  //   IconData? icon,
  //   String iconName='',
  //   required String title,
  // }) =>
  //     InkWell(
  //       onTap: (() {
  //         Navigator.of(context).push(MaterialPageRoute<void>(
  //             builder: (context) => const PhoneAuthPage()));
  //       }),
  //       child: Container(
  //           decoration: BoxDecoration(
  //             color: Colors.white.withOpacity(0.05),
  //             borderRadius: BorderRadius.circular(15),
  //           ),
  //           child: Row(
  //             children: [
  //               Padding(
  //                   padding: const EdgeInsets.only(
  //                     top: 4,
  //                     bottom: 4,
  //                     left: 4,
  //                     right: 24, //24
  //                   ),
  //                   child: Container(
  //                     width: 54,
  //                     height: 54,
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(13)),
  //                     child: icon != null
  //                         ? Icon(icon,
  //                             color: Colors.black, size: 21)
  //                         : Padding(
  //                             padding: const EdgeInsets.all(17),
  //                             child: Image.asset(
  //                               'assets/icons/$iconName.png',
  //                               width: 21.sp, //24
  //                               height: 21.sp,
  //                             ),
  //                           ),
  //                   )),
  //               Text(
  //                 title,
  //                 style: TextStyle(
  //                     fontSize: getResSize(16), //16
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w400),
  //               )
  //             ],
  //           )),
  //     );
}






