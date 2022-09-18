import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
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
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 65,
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading:
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: backButton(context),
        )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 31, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              const Text(
                'Введите адрес\nэлектронной почты',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w400),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 26, bottom: 36),
                child: Text(
                  'Чтобы восстановить доступ\nк своему аккаунту',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 62),
                child: TextFormField(
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                    // contentPadding: EdgeInsets.only(left: 15),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Введите адрес электронной почты',
                    hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey
                    )
                  ),
                ),
              ),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: buttonStyleCustom(padH: 0, padV: 28, radius: 20),
                    onPressed: () {
                      // SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
                      FocusManager.instance.primaryFocus?.unfocus();

                      Navigator.of(context).push(MaterialPageRoute<void>(
                          builder: (context) => const LoginSecondPage()));
                    },
                    child: Text(
                      'Восстановить доступ',
                      style:
                      TextStyle(
                          fontSize: 18.5.sp,     //18
                          fontWeight: FontWeight.w500,
                          color: Colors.white
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
