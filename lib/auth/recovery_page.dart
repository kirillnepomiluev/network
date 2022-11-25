import 'package:flutter/material.dart';
import 'package:network_app/auth/recovery_email_page.dart';
import 'package:network_app/components/general_widgets.dart';
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
    return Scaffold(
      body: SafeArea(child:
      Padding(
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
                child: EnterRowContainer(
                  func: (){
                    Navigator.of(context).push(MaterialPageRoute<void>(
                        builder: (context) => const RecoveryEmailPage()));
                  },
                  icon: Icons.email,
                  title: 'Войти с помошью почты',
                  // leftPad: 24.sp   //30
                ),
              ),

            ],
          ))
        ,),
    );

  }


}
