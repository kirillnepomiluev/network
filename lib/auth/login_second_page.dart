import 'package:flutter/material.dart';
import 'package:network_app/auth/login_page.dart';
import 'package:network_app/auth/phone_auth_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/main.dart';
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
    // print('mediaWitdh - $mediaWitdh  mediaHeight - $mediaHeight');

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 20),
          child: troubleEnter(context)),
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                Constants.strLoremIpsum,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17.5.sp, //16
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 57),
                child: enterContainer(
                  iconName: 'icon',
                  title: 'Войти по номеру телефона',
                  leftPad: 30
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: enterContainer(
                  iconName: 'logo_google',
                  title: 'Войти через Google',
                  leftPad: 28
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: enterContainer(
                  iconName: 'logo_facebook',
                  title: 'Войти через Facebook',
                  leftPad: 28
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget enterContainer({required String iconName, required String title, required double leftPad}) => InkWell(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const PhoneAuthPage()));
        }),
        child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child:
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: leftPad,       //28
                    right: 20,      //20
                  ),
                  child: iconName == 'icon'
                      ? Icon(Network.call, color: Colors.white, size: 20)
                      : Image.asset(
                          'assets/icons/$iconName.png',
                          width: 24,
                          height: 24,
                        ),
                ),

                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.sp, //18
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
        ),
      );
}
