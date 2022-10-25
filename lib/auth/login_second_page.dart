import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:network_app/auth/phone_auth_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
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
    return AuthBackScaffold(
      centerYellow: true,
      hasTroubleEnter: true,
      childColumn: Padding(
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
                child: enterContainer(
                  iconName: 'icon',
                  title: 'Войти по номеру телефона',
                  // leftPad: 24.sp   //30
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: enterContainer(
                  iconName: 'logo_google',
                  title: 'Войти через Google',
                  // leftPad: 23.sp   //28
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: enterContainer(
                  iconName: 'logo_facebook',
                  title: 'Войти через Facebook',
                  // leftPad: 23.sp   //28
                ),
              ),
            ],
          )),
    );

  }

  Widget enterContainer({
    required String iconName,
    required String title,
  }) =>
      InkWell(
        onTap: (() {
          Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (context) => const PhoneAuthPage()));
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
                      child: iconName == 'icon'
                          ? const Icon(Network.call,
                              color: Colors.black, size: 21)
                          : Padding(
                              padding: const EdgeInsets.all(17),
                              child: Image.asset(
                                'assets/icons/$iconName.png',
                                width: 21.sp, //24
                                height: 21.sp,
                              ),
                            ),
                    )),
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

class EnterInfoContainer extends StatelessWidget {
  final double padTop;
  final String text1;
  final String text2;
  final String? description;
  final int? maxLines;
  const EnterInfoContainer(
      {Key? key,
      required this.text1,
      required this.text2,
      this.maxLines,
      this.description,
        required this.padTop
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padTop),
      child: BlurryContainer(
        width: double.infinity,
        blur: 20,
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRichText(text1: text1, text2: text2),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                description ?? Constants.strLoremIpsum,
                maxLines: maxLines,
                style: const TextStyle(
                    fontSize: 14,
                    color: ConstColor.greyText,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
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
            fontSize: 20.sp, //24
            fontWeight: FontWeight.w500,
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
