import 'package:flutter/material.dart';
import 'package:network_app/auth/login_second_page.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseSexPage extends StatefulWidget {
  const ChooseSexPage({Key? key}) : super(key: key);

  @override
  State<ChooseSexPage> createState() => _ChooseSexPageState();
}

class _ChooseSexPageState extends State<ChooseSexPage> {

  String strSex = '';

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
                  text1: 'Выберете ',
                  text2: 'пол',
                  description: 'Вы можете скрыть свой пол',
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(children: [

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 23),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white, width: 1,)
                            ),
                            backgroundColor: strSex == 'female'? Colors.white : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              strSex = 'female';
                            });
                          },
                          child: Text(
                            'Женщина',
                            style: TextStyle(
                              color: strSex == 'female'? Colors.black : Colors.white,
                                fontSize: 18.5.sp, //18
                                fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),

                    const SizedBox(height: 50,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 23),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(color: Colors.white, width: 1,)
                            ),
                            backgroundColor: strSex == 'male'? Colors.white : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              strSex = 'male';
                            });
                          },
                          child: Text(
                            'Мужчина',
                            style: TextStyle(
                              color: strSex == 'male'? Colors.black : Colors.white,
                              fontSize: 18.5.sp, //18
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ),


                  ],),
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
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          side: BorderSide(color: ConstColor.salad100, width: 2),
                          value: value,
                          onChanged: (newValue){
                            strSex = '';
                            setState(() {
                              value = newValue!;
                            });
                          }),

                      Text('Скрыть пол', style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400
                      ),)

                    ],),
                ),


                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(
                          color: strSex!='' || value? Colors.white : ConstColor.white15,
                          padH: 0, padV: 22, radius: 20),
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const LoginSecondPage()));
                      },
                      child: Text(
                        'Продолжить',
                        style: TextStyle(
                            fontSize: 18.5.sp, //18
                            fontWeight: FontWeight.w500,
                            color: strSex!='' || value? Colors.black : ConstColor.textGray
                        ),
                      )),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
