import 'package:flutter/material.dart';
import 'package:network_app/auth_profile_info/choose_occupation.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputStatusPage extends StatefulWidget {
  const InputStatusPage({Key? key}) : super(key: key);

  @override
  State<InputStatusPage> createState() => _InputStatusPageState();
}

class _InputStatusPageState extends State<InputStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackButtonCustom(),
                    Container(
                        decoration: BoxDecoration(
                          color: ConstColor.white10,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 18
                        ),
                        child:Row(children: const [
                          Text('Пропустить'),
                          Icon(Icons.close_rounded, color: ConstColor.salad100,)
                        ],)
                    ),
                  ],),
                const EnterInfoContainer(
                  padTop: 32,
                  text1: 'Введите свой ',
                  text2: 'статус',
                  description: 'Статус будет отображаться в вашем профиле',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 36, bottom: 36),
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
                            borderSide: const BorderSide(
                                width: 1, color: ConstColor.salad100),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: ConstColor.salad100),
                            borderRadius: BorderRadius.circular(20)),
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ConstColor.textGray)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: buttonStyleCustom(
                          color: Colors.white, padH: 0, padV: 22, radius: 20),
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();

                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const ChooseOccupationPage()));
                      },
                      child: Text(
                        'Продолжить',
                        style: TextStyle(
                            fontSize: 18.5.sp, //18
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
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
