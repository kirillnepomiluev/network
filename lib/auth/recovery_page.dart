import 'package:flutter/material.dart';
import 'package:network_app/auth/recovery_email_page.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class RecoveryPage extends StatefulWidget {
  const RecoveryPage({Key? key}) : super(key: key);

  @override
  State<RecoveryPage> createState() => _RecoveryPageState();
}

class _RecoveryPageState extends State<RecoveryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Восстановление\nаккаунта',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 21.5.sp,      //24
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  // width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    Constants.strLoremIpsum,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.5.sp,     //16
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child:

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(padH: 0, padV: 28, radius: 20),
                      onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (context) => const RecoveryEmailPage()));
                      },
                      child: Text(
                        'Войти с помощью почты',
                        style:
                        TextStyle(
                            fontSize: 18.5.sp,     //18
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),
                      )),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
