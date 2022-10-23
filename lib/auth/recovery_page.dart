import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/auth/recovery_email_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecoveryPage extends StatefulWidget {
  const RecoveryPage({Key? key}) : super(key: key);

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  double mediaWitdh = 0;
  double mediaHeight = 0;

  @override
  Widget build(BuildContext context) {
    mediaHeight = MediaQuery.of(context).size.height;
    mediaWitdh = MediaQuery.of(context).size.width;
    return AuthBackScaffold(
      centerYellow: true,
      hasTroubleEnter: false,
      childColumn: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BackButtonCustom(),
              ),

              const EnterInfoContainer(
                padTop: 32,
                text1: 'Восстановление\n',
                text2: 'аккаунта',
                // maxLines: 3,
              ),

              Padding(
                padding: EdgeInsets.only(
                    top: 30.sp //57
                    ),
                child: enterContainer(
                  iconName: 'icon',
                  title: 'Войти с помощью почты',
                  // leftPad: 24.sp   //30
                ),
              ),
            ],
          )),
    );

    // Scaffold(
    //   backgroundColor: ConstColor.blackBack,
    //   body: SafeArea(
    //     child: Stack(
    //       children: [
    //
    //         Positioned(
    //             right: 0,
    //             child: Image.asset('assets/images/circles/ellipse_3.png')),
    //
    //         Positioned(
    //             top: mediaHeight*0.15,
    //             left: 0,
    //             child: Image.asset('assets/images/circles/ellipse_2.png')),
    //
    //         Padding(
    //             padding: const EdgeInsets.symmetric(horizontal: 16),
    //             child: Column(
    //               children: [
    //
    //                 Padding(
    //                   padding: const EdgeInsets.only(top: 10),
    //                   child: backButton(context),
    //                 ),
    //
    //                 // _enterInfo(),
    //
    //                 const EnterInfoContainer(
    //                   text1: 'Восстановление\n',
    //                   text2: 'аккаунта',
    //                   // maxLines: 3,
    //                 ),
    //
    //                 Padding(
    //                   padding: EdgeInsets.only(top: 30.sp //57
    //                   ),
    //                   child: enterContainer(
    //                     iconName: 'icon',
    //                     title: 'Войти с помощью почты',
    //                     // leftPad: 24.sp   //30
    //                   ),
    //                 ),
    //
    //               ],
    //             )),
    //       ],
    //     ),
    //   ));
  }

  Widget enterContainer({
    required String iconName,
    required String title,
  }) =>
      InkWell(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const RecoveryEmailPage()));
        }),
        child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      top: 4,
                      bottom: 4,
                      left: 4,
                      right: 24, //24
                    ),
                    child: Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13)),
                        child: const Icon(
                            // Icons.email,
                          Network.email_outlined,
                            color: Colors.black, size: 21))),
                Text(
                  title,
                  style: TextStyle(
                      fontSize: getResSize(16), //16
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                )
              ],
            )),
      );
}

// class RecoveryPage extends StatefulWidget {
//   const RecoveryPage({Key? key}) : super(key: key);
//
//   @override
//   State<RecoveryPage> createState() => _RecoveryPageState();
// }
//
// class _RecoveryPageState extends State<RecoveryPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey.shade400,
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 50),
//                 child: SizedBox(
//                   // width: MediaQuery.of(context).size.width * 0.8,
//                   child: Text(
//                     'Восстановление\nаккаунта',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 21.5.sp,      //24
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 20),
//                 child: SizedBox(
//                   // width: MediaQuery.of(context).size.width * 0.8,
//                   child: Text(
//                     Constants.strLoremIpsum,
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 17.5.sp,     //16
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 30),
//                 child:
//
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       style: buttonStyleCustom(padH: 0, padV: 28, radius: 20),
//                       onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute<void>(
//                                 builder: (context) => const RecoveryEmailPage()));
//                       },
//                       child: Text(
//                         'Войти с помощью почты',
//                         style:
//                         TextStyle(
//                             fontSize: 18.5.sp,     //18
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white
//                         ),
//                       )),
//                 ),
//
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
