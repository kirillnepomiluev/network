import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/auth_profile_info/choose_sex.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputBirthPage extends StatefulWidget {
  const InputBirthPage({Key? key}) : super(key: key);

  @override
  State<InputBirthPage> createState() => _InputBirthPageState();
}

class _InputBirthPageState extends State<InputBirthPage> {

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
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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


                // Center(
                //   child: CheckboxListTile(
                //     dense: true,
                //     controlAffinity: ListTileControlAffinity.leading,
                //     value: value,
                //     onChanged: (newValue){
                //         setState(() {
                //           value = newValue!;
                //         });
                //   },
                //         side: BorderSide(color: ConstColor.salad100, width: 2),
                //     title: Text('Скрыть возраст', style: TextStyle(color: Colors.white),),
                //   ),
                // )

                Padding(
                  padding: const EdgeInsets.only(top: 43),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Checkbox(
                      side: BorderSide(color: ConstColor.salad100, width: 2),
                        value: value,
                        onChanged: (newValue){
                      setState(() {
                        value = newValue!;
                      });
                    }),

                    Text('Скрыть возраст', style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),)

                  ],),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
