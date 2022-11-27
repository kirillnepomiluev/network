import 'package:flutter/material.dart';
import 'package:network_app/meetings/creqte_request/calendar.dart';
import 'package:network_app/meetings/creqte_request/describe_meeting.dart';
import 'package:network_app/components/choose_status.dart';
import 'package:network_app/components/general_widgets.dart';
import 'package:network_app/constants.dart';
import 'package:network_app/components/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';



class ChooseMeetingDate extends StatefulWidget {
  const ChooseMeetingDate({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseMeetingDate> createState() => _ChooseMeetingDateState();
}

class _ChooseMeetingDateState extends State<ChooseMeetingDate> {
  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: mediaTop),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        BackButtonCustom(),
                        Center(
                            child: Text(
                          'Создание личного запроса',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.5.sp, //18
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                      ],
                    ),
                  ),
                  EnterInfoContainer(
                    padTop: 40,
                    text1: 'Укажите период для\n',
                    text2: 'планирования встречи',
                    description:
                        'Здесь будет небольшое описание, что именно здесь нужно указать',
                  ),


                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
                    child: Text('Выбрать дату начала',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                  ),
                  TableBasicsExample(),

                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 20),
                    child: Text('Выбрать дату окончания',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  TableBasicsExample(),


                  Padding(
                    padding:
                        const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                        ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: buttonStyleCustom(
                              color: Colors.white,
                              padH: 0,
                              padV: 22,
                              radius: 20),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute<void>(
                                builder: (context) =>
                                    const InputDescribeMeeting()));
                          },
                          child: Text(
                            'Продолжить',
                            style: TextStyle(
                                fontSize: 18.5.sp, //18
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                    ),
                  ),
     
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
