import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_sex/choose_sex.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseDatePage extends StatefulWidget {
  const ChooseDatePage({Key? key}) : super(key: key);

  @override
  State<ChooseDatePage> createState() => _ChooseDatePageState();
}

class _ChooseDatePageState extends State<ChooseDatePage> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: BackButtonCustom(),
                ),
                const EnterInfoContainer(
                  padTop: 32,
                  text1: 'Введите ',
                  text2: 'дату рождения',
                  description: 'Вы можете скрыть свой возраст',
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 45),
                  child: RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, //20
                        fontWeight: FontWeight.w500,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'ММ',
                        ),
                         TextSpan(
                            text: '  /  ',
                            style:  TextStyle(
                              color: ConstColor.salad100,
                            )),


                        TextSpan(
                          text: 'DD',
                        ),
                         TextSpan(
                            text: '  /  ',
                            style:  TextStyle(
                              color: ConstColor.salad100,
                            )),

                        TextSpan(
                          text: 'YYYY',
                        ),

                      ],
                    ),
                    // minFontSize: 14,
                  )
                ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(
                          color: Colors.white, padH: 0, padV: 22, radius: 20),
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const ChooseSexPage()));
                      },
                      child: Text(
                        'Продолжить',
                        style: TextStyle(
                            fontSize: 18.5.sp, //18
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      )),
                ),


                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child:
                  SizedBox(
                      width: 185,
                      child: CustomCheckListTile(title: 'Скрыть возраст',))
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
