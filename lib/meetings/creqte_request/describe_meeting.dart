import 'package:flutter/material.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/meetings/creqte_request/meeting_occupation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InputDescribeMeeting extends StatefulWidget {
  const InputDescribeMeeting({Key? key}) : super(key: key);

  @override
  State<InputDescribeMeeting> createState() => _InputDescribeMeetingState();
}

class _InputDescribeMeetingState extends State<InputDescribeMeeting> {
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

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child:
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      BackButtonCustom(),
                      Center(child: Text('Создание личного запроса',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.5.sp,   //18
                          fontWeight: FontWeight.w600,
                        ),
                      ))
                    ],
                  ),
                ),

                const EnterInfoContainer(
                  padTop: 32,
                  text1: 'Кратко опишите ',
                  text2: 'какую\nвстречу вы планируете',
                  description: 'Здесь будет небольшое описание, что именно здесь нужно указать',
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

                        print('to ChooseMeetingOccupation');

                        Navigator.of(context).push(MaterialPageRoute<void>(
                            builder: (context) => const ChooseMeetingOccupation()));
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
