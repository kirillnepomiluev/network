import 'package:flutter/material.dart';
import 'package:network_app/ui/pages/auth_pages/welcome_pages/input_info_pages/choose_date/choose_date.dart';
import 'package:network_app/ui/widgets/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputNamePage extends StatefulWidget {
  const InputNamePage({Key? key}) : super(key: key);

  @override
  State<InputNamePage> createState() => _InputNamePageState();
}

class _InputNamePageState extends State<InputNamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: BackButtonCustom(),
                ),
                const EnterInfoContainer(
                  padTop: 32,
                  text1: 'Введите ',
                  text2: 'ваше имя',
                  description: 'Так оно будет отображаться в Network',
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
                            borderSide: const BorderSide(
                                width: 1, color: ConstColor.salad100),
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: ConstColor.salad100),
                            borderRadius: BorderRadius.circular(20)),
                        // hintText: 'Введите адрес электронной почты',
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
                            builder: (context) => const ChooseDatePage()));
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
