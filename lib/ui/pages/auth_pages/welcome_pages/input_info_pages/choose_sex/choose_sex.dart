import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_level/choose_level.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
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
                const Padding(
                  padding: EdgeInsets.only(top: 10),
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
                            padding: const EdgeInsets.symmetric(vertical: 23),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(color: Colors.white, width: 1,)
                            ),
                            backgroundColor: strSex == 'female'? Colors.white : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              strSex = 'female';
                              value = false;
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
                            padding: const EdgeInsets.symmetric(vertical: 23),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(color: Colors.white, width: 1,)
                            ),
                            backgroundColor: strSex == 'male'? Colors.white : Colors.transparent,
                          ),
                          onPressed: () {
                            setState(() {
                              strSex = 'male';
                              value = false;
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

                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 25),
                  child:
                  SizedBox(
                      width: 185,
                      child:

                      CheckboxListTile(
                        checkColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: value,
                        onChanged: (newValue){
                          setState(() {
                            strSex='';
                            value = newValue!;
                          });
                        },
                        activeColor: ConstColor.salad100,
                        title: Transform.translate(
                          offset: const Offset(-10, 0),
                          child: const Text('Скрыть пол', style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                      )


                  )

                ),


                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(
                          color: strSex!='' || value? Colors.white : ConstColor.white15,
                          padH: 0, padV: 22, radius: 20),
                      onPressed: () {

                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const ChooseLevelPage()));
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
