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
    // if (kDebugMode) {
    //   print('mediaWitdh - $mediaWitdh  mediaHeight - $mediaHeight');
    // }

    return Scaffold(
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 20),
          child: troubleEnter(context)),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.068 * mediaHeight), //49
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // alignment: Alignment.centerRight,
                  width: mediaWitdh * 0.72, //270
                  height: mediaWitdh * 0.72, //289
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 0.04 * mediaWitdh, top: 0.062 * mediaHeight), //45
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
                  padding: EdgeInsets.only(top: 0.07 * mediaHeight), //51
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.152 * mediaWitdh, //57
                              vertical:
                                  0.028 * mediaHeight //0.053*mediaWidth  20
                              // horizontal: mediaWitdh<420? 30 : 57,  //57
                              // vertical: 20,    //20
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
                        padding:
                            EdgeInsets.only(left: 0.0266 * mediaWitdh), //10
                        child: InkWell(
                          onTap: (() {}),
                          child: Container(
                            padding: EdgeInsets.all(0.0586*mediaWitdh),
                            // padding: const EdgeInsets.all(22),
                            width: 0.1706 * mediaWitdh, //66
                            height: 0.1706 * mediaWitdh, //64
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
                            EdgeInsets.only(left: 0.0266 * mediaWitdh), // 10
                        child: Container(
                          padding: EdgeInsets.all(0.0266*mediaWitdh),
                          width: 0.1706 * mediaWitdh, //66
                          height: 0.1706 * mediaWitdh, //64
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

                // Padding(
                //   padding: const EdgeInsets.only(top: 41, left: 200),
                //   child: troubleEnter(context),
                // ),

                // troubleEnter(context),

                // Container(
                //     padding: const EdgeInsets.only(top: 20, left: 170),
                //     // alignment: Alignment.bottomRight,
                //     child: InkWell(
                //         onTap: (() {
                //           Navigator.of(context).push(MaterialPageRoute<void>(
                //               builder: (context) => const RecoveryPage()));
                //         }),
                //         child: const Text(
                //           'Проблемы со входом?',
                //           style: TextStyle(
                //               decoration: TextDecoration.underline,
                //               fontWeight: FontWeight.w600),
                //         )
                //     )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget troubleEnter(BuildContext context) => InkWell(
      onTap: (() {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (context) => const RecoveryPage()));
      }),
      child: SizedBox(
        height: 30,
        // width: 200,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: const [
            Positioned(
              bottom: 10,
              child: Text(
                'Проблемы со входом?',
                style: TextStyle(
                    fontSize: 14,  //14
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              // padding: EdgeInsets.only(top: 8),
              child: Text(
                '________________________',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
