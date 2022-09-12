import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:network_app/main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

//width 375
//height 812

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWitdh = MediaQuery.of(context).size.width;

    final contWidth = 70.sp;    //270

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: newtworkRow(isAppBar: true),
        ),
      ),
      body: Stack(
        children: [

          Positioned(
              bottom: 17.sp,  //5
              right: 17.sp,   //10
              child: troubleEnter(context)),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.only(
                    top: 28.sp
                ), //49
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: contWidth, //270
                    height: contWidth, //289
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 17.5.sp,
                    top: 28.sp
                    // left: 0.04 * mediaWitdh,  //15
                    // top: 0.0624*mediaHeight //45
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Главное в связах\n - это связи',
                      style: TextStyle(
                        fontSize: 26.sp, //36
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          top: 26.sp
                      ), //51
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          SizedBox(
                            width: 56.sp,  //168
                            height: 35.sp,  //62
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute<void>(
                                    builder: (context) => const LoginSecondPage()));
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    // side: BorderSide(color: Colors.red)
                                  ))
                                // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                              ),
                              child:
                              Text(
                                'Войти',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp, //18
                                    color: Colors.black),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(
                                left: 14.sp //10
                            ), //10
                            child: InkWell(
                              onTap: (() {}),
                              child: Container(
                                padding: EdgeInsets.all(
                                  10.sp
                                    // 0.0586*mediaWitdh
                                ),
                                // padding: const EdgeInsets.all(22),
                                width: 35.sp, //66
                                height: 35.sp, //64
                                decoration: BoxDecoration(
                                  // image: DecorationImage(
                                  //     image: AssetImage('assets/icons/logo_google.png')
                                  // ),
                                  // color: Colors.black87,
                                  color: Colors.grey.shade800,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                // child: const Center(child: Text('G', style: TextStyle(color: Colors.red, fontSize: 20),),),
                                child: Image.asset(
                                  'assets/icons/logo_google.png',
                                  // width: ,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsets.only(left: 14.sp), // 10
                            child: Container(
                              padding: EdgeInsets.all(
                                  10.sp
                                  // 0.0266*mediaWitdh
                              ),
                              width: 35.sp, //66
                              height: 35.sp, //64
                              decoration: BoxDecoration(
                                // color: Colors.black87,
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                'assets/icons/logo_facebook.png',
                                // fit: BoxFit.fitWidth,
                                // width: 45,
                                // height: 45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}


// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     final mediaHeight = MediaQuery.of(context).size.height;
//     final mediaWitdh = MediaQuery.of(context).size.width;
//
//     // final contWidth = mediaWitdh * 0.72;
//     final contWidth = mediaHeight * 0.37448;
//
//     return Scaffold(
//       // bottomNavigationBar: Padding(
//       //     padding: EdgeInsets.only(
//       //         bottom: 0.02774*mediaHeight,  //20
//       //         right: 0.0533*mediaWitdh   //20
//       //     ),
//       //     child: troubleEnter(context)),
//       backgroundColor: Colors.grey.shade400,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         toolbarHeight: 65,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Padding(
//           padding: const EdgeInsets.only(top: 10),
//           child: newtworkRow(isAppBar: true),
//         ),
//       ),
//       body: Stack(
//         children: [
//
//           Positioned(
//               // right: 10,
//               // bottom: 5,
//                     bottom: 0.0069*mediaHeight,  //5
//                     right: 0.01387*mediaHeight,   //10
//               child: troubleEnter(context)),
//
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Padding(
//                 // padding: EdgeInsets.only(top: 0.13*mediaWitdh), //49
//                 padding: EdgeInsets.only(top: 0.06796*mediaHeight), //49
//                 child: Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     width: contWidth, //270
//                     height: contWidth, //289
//                     decoration: const BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(10),
//                           bottomLeft: Radius.circular(10)),
//                     ),
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: EdgeInsets.only(
//                     left: 0.04 * mediaWitdh,  //15
//                     // top: 0.12*mediaWitdh //45
//                     top: 0.0624*mediaHeight //45
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Главное в связах\n - это связи',
//                       style: TextStyle(
//                         fontSize: 26.sp, //36
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//
//                     Padding(
//                       // padding: EdgeInsets.only(top: 0.136 * mediaWitdh), //51
//                       padding: EdgeInsets.only(top: 0.07 * mediaHeight), //51
//                       child: Wrap(
//                         direction: Axis.horizontal,
//                         children: [
//                           ElevatedButton(
//                             onPressed: () {
//                               Navigator.of(context).push(MaterialPageRoute<void>(
//                                   builder: (context) => const LoginSecondPage()));
//                             },
//                             style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all(Colors.white),
//                                 shape: MaterialStateProperty.all<
//                                     RoundedRectangleBorder>(RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15),
//                                   // side: BorderSide(color: Colors.red)
//                                 ))
//                                 // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//                                 ),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   // horizontal: mediaWitdh<300? 10 : 0.152 * mediaWitdh, //57
//                                   horizontal: 0.152 * mediaWitdh, //57
//                                   vertical: 0.152 * mediaWitdh*0.35 //20
//                                   ),
//                               child: Text(
//                                 'Войти',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 18.sp, //18
//                                     color: Colors.black),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 0.0266 * mediaWitdh), //10
//                             child: InkWell(
//                               onTap: (() {}),
//                               child: Container(
//                                 padding: EdgeInsets.all(0.0586*mediaWitdh),
//                                 // padding: const EdgeInsets.all(22),
//                                 width: 0.1706 * mediaWitdh, //66
//                                 height: 0.1706 * mediaWitdh, //64
//                                 decoration: BoxDecoration(
//                                   // image: DecorationImage(
//                                   //     image: AssetImage('assets/icons/logo_google.png')
//                                   // ),
//                                   // color: Colors.black87,
//                                   color: Colors.grey.shade800,
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 // child: const Center(child: Text('G', style: TextStyle(color: Colors.red, fontSize: 20),),),
//                                 child: Image.asset(
//                                   'assets/icons/logo_google.png',
//                                   // width: ,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding:
//                                 EdgeInsets.only(left: 0.0266 * mediaWitdh), // 10
//                             child: Container(
//                               padding: EdgeInsets.all(0.0266*mediaWitdh),
//                               width: 0.1706 * mediaWitdh, //66
//                               height: 0.1706 * mediaWitdh, //64
//                               decoration: BoxDecoration(
//                                 // color: Colors.black87,
//                                 color: Colors.grey.shade800,
//                                 borderRadius: BorderRadius.circular(15),
//                               ),
//                               child: Image.asset(
//                                 'assets/icons/logo_facebook.png',
//                                 // fit: BoxFit.fitWidth,
//                                 // width: 45,
//                                 // height: 45,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

Widget troubleEnter(BuildContext context) {

  return InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => const RecoveryPage()));
      }),
      child: SizedBox(
        height: 23.sp,   //30
        width: 56.sp,   //160
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Positioned(
              right: 0,
              bottom: 10,
              child: Text(
                'Проблемы со входом?',
                style: TextStyle(
                    fontSize: 16.5.sp,  //14
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              // padding: EdgeInsets.only(top: 8),
              child: Text(
                '_____________________________',
                style: TextStyle(
                    fontSize: 15.5.sp,  //12
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
}
