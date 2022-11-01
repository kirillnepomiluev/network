import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecoveryEmailPage extends StatefulWidget {
  const RecoveryEmailPage({Key? key}) : super(key: key);

  @override
  State<RecoveryEmailPage> createState() => _RecoveryEmailPageState();
}

class _RecoveryEmailPageState extends State<RecoveryEmailPage> {
  @override
  Widget build(BuildContext context) {
    return AuthBackScaffold(
      centerYellow: true,
      hasTroubleEnter: false,
      childColumn: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BackButtonCustom(),
              ),
              const EnterInfoContainer(
                padTop: 32,
                text1: 'Введите адрес\n',
                text2: 'электронной почты',
                description: 'Чтобы восстановить доступ\nк своему аккаунту',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 36, bottom: 62),
                child: TextFormField(
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.white,
                  autofocus: true,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 22, horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1, color: ConstColor.salad100),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      hintText: 'Введите адрес электронной почты',
                      hintStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ConstColor.textGray)
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: buttonStyleCustom(
                        color: Colors.white,

                        padH: 0, padV: 22, radius: 20),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();

                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const LoginSecondPage())
                      );

                    },
                    child: Text(
                      'Восстановить доступ',
                      style: TextStyle(
                          fontSize: 18.5.sp, //18
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
