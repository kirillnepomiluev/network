import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/auth/recovery_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
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
    return AuthBackScaffold(
        hasTroubleEnter: true,
        centerYellow: false,
        childColumn: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 188),
              child: NetworkRow(isRow: false, opacity: 0.05),
            )),
            Padding(
              padding: EdgeInsets.only(left: 17.5.sp, top: 120 // 28.sp
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRichText(
                      text1: 'Главное в связах\n - это ', text2: 'связи'),
                  Padding(
                    padding: EdgeInsets.only(top: 26.sp), //51
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 56.sp, //168
                          height: 35.sp, //62
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                      builder: (context) =>
                                          const LoginSecondPage()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  // side: BorderSide(color: Colors.red)
                                ))
                                // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                                ),
                            child: Text(
                              'Войти',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp, //18
                                  color: Colors.black),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.sp //10
                              ), //10
                          child: InkWell(
                            onTap: (() {}),
                            child: Container(
                              padding: EdgeInsets.all(22),
                              // padding: const EdgeInsets.all(22),
                              width: 35.sp, //66
                              height: 35.sp, //64
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Image.asset(
                                'assets/icons/logo_google.png',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.sp), // 10
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 35.sp, //66
                            height: 35.sp, //64
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              'assets/icons/logo_facebook.png',
                              width: 10,
                              height: 10,
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
        )
    );

    //   Scaffold(
    //   backgroundColor: ConstColor.blackBack,
    //   body:
    //   SafeArea(
    //     child: Stack(
    //       children: [
    //
    //         Positioned(
    //             right: 0,
    //             child: Image.asset('assets/images/circles/ellipse_3.png')
    //         ),
    //
    //         Positioned(
    //           left: 0,
    //             child: Image.asset('assets/images/circles/ellipse_2.png')
    //         ),
    //
    //         Positioned(
    //             bottom: 17.sp,  //5
    //             right: 17.sp,   //10
    //             child: troubleEnter(context)),
    //
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //
    //             const Center(child: Padding(
    //               padding: EdgeInsets.only(top: 188),
    //               child: NetworkRow(isRow: false, opacity: 0.05),
    //             )),
    //
    //             Padding(
    //               padding: EdgeInsets.only(
    //                 left: 17.5.sp,
    //                   top: 120 // 28.sp
    //               ),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //
    //                   _buildRichText(
    //                       text1: 'Главное в связах\n - это ',
    //                       text2: 'связи'
    //                   ),
    //
    //                   Padding(
    //                     padding: EdgeInsets.only(
    //                         top: 26.sp
    //                     ), //51
    //                     child: Wrap(
    //                       direction: Axis.horizontal,
    //                       children: [
    //                         SizedBox(
    //                           width: 56.sp,  //168
    //                           height: 35.sp,  //62
    //                           child: ElevatedButton(
    //                             onPressed: () {
    //                               Navigator.of(context).push(MaterialPageRoute<void>(
    //                                   builder: (context) => const LoginSecondPage()));
    //                             },
    //                             style: ButtonStyle(
    //                                 backgroundColor:
    //                                 MaterialStateProperty.all(Colors.white),
    //                                 shape: MaterialStateProperty.all<
    //                                     RoundedRectangleBorder>(RoundedRectangleBorder(
    //                                   borderRadius: BorderRadius.circular(15),
    //                                   // side: BorderSide(color: Colors.red)
    //                                 ))
    //                               // backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    //                             ),
    //                             child:
    //                             Text(
    //                               'Войти',
    //                               style: TextStyle(
    //                                   fontWeight: FontWeight.w500,
    //                                   fontSize: 18.sp, //18
    //                                   color: Colors.black),
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding:
    //                           EdgeInsets.only(
    //                               left: 14.sp //10
    //                           ), //10
    //                           child: InkWell(
    //                             onTap: (() {}),
    //                             child: Container(
    //                               padding: EdgeInsets.all(
    //                                   22
    //                               ),
    //                               // padding: const EdgeInsets.all(22),
    //                               width: 35.sp, //66
    //                               height: 35.sp, //64
    //                               decoration: BoxDecoration(
    //                                 color: Colors.grey.shade800,
    //                                 borderRadius: BorderRadius.circular(15),
    //                               ),
    //                               child: Image.asset(
    //                                 'assets/icons/logo_google.png',
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                         Padding(
    //                           padding:
    //                           EdgeInsets.only(left: 14.sp), // 10
    //                           child: Container(
    //                             padding: EdgeInsets.all(
    //                                 20
    //                             ),
    //                             width: 35.sp, //66
    //                             height: 35.sp, //64
    //                             decoration: BoxDecoration(
    //                               color: Colors.grey.shade800,
    //                               borderRadius: BorderRadius.circular(15),
    //                             ),
    //                             child: Image.asset(
    //                               'assets/icons/logo_facebook.png',
    //                               width: 10,
    //                               height: 10,
    //                             ),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }

  Widget _buildRichText({
    String text1 = '',
    String text2 = '',
  }) =>
      RichText(
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.sp, //36
            fontWeight: FontWeight.w700,
          ),
          children: <TextSpan>[
            TextSpan(
              text: text1,
            ),
            TextSpan(
                text: text2,
                style: const TextStyle(
                  color: ConstColor.salad100,
                )),
          ],
        ),
        // minFontSize: 14,
      );
}

Widget troubleEnter(BuildContext context) {
  return InkWell(
    onTap: (() {
      Navigator.of(context).push(
          MaterialPageRoute<void>(builder: (context) => const RecoveryPage()));
    }),
    child: SizedBox(
      height: 23.sp, //30
      width: 55.5.sp, //160
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Positioned(
            right: 0,
            bottom: 10,
            child: Text(
              'Проблемы со входом?',
              style: TextStyle(
                  color: ConstColor.greyText,
                  fontSize: 16.5.sp, //14
                  fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            // padding: EdgeInsets.only(top: 8),
            child: Text(
              '_____________________________',
              style: TextStyle(
                  color: ConstColor.greyText,
                  fontSize: 15.5.sp, //12
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    ),
  );
}
