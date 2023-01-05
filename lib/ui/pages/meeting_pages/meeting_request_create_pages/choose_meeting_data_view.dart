import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/navigation/app_router.gr.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/widgets/buttons/app_back_button.dart';
import 'package:network_app/ui/widgets/cards/enter_info_container.dart';
import 'package:network_app/ui/widgets/common/general_widgets.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';



class ChooseMeetingDateView extends StatefulWidget {
  const ChooseMeetingDateView({
    Key? key,
  }) : super(key: key);

  @override
  State<ChooseMeetingDateView> createState() => _ChooseMeetingDateViewState();
}

class _ChooseMeetingDateViewState extends State<ChooseMeetingDateView> {
  @override
  Widget build(BuildContext context) {
    final mediaTop = MediaQuery.of(context).viewPadding.top;

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
                        const AppBackButton(),
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
                  const EnterInfoContainer(
                    padTop: 40,
                    text1: 'Укажите период для ',
                    text2: 'планирования встречи',
                    description:
                        'Здесь будет небольшое описание, что именно здесь нужно указать',
                  ),


                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text('Выбрать дату начала',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                  ),

                  const CustomCalendar(),

                  const Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Text('Выбрать дату окончания',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                  const CustomCalendar(),


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
                            context.router.push(const CheckMeetingParametersViewRoute());
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



class CustomCalendar extends StatefulWidget {
  const CustomCalendar({Key? key}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final kToday = DateTime.now();
  DateTime kFirstDay = DateTime.now();
  DateTime kLastDay = DateTime.now();


  @override
  void initState() {
    kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
    super.initState();
  }

  // CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(12)
      ),
      child: TableCalendar<dynamic>(
        calendarStyle: const CalendarStyle(
          defaultTextStyle: TextStyle(color: Colors.white),
          holidayTextStyle: TextStyle(color: Colors.white),
          weekendTextStyle: TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
              color: Colors.transparent
          ),
          //   defaultDecoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     color: ConstColor.salad100
          // ),
          selectedDecoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.salad100
          ),
          selectedTextStyle: TextStyle(color: Colors.black),
        ),
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        locale: 'ru_RU',
        availableGestures: AvailableGestures.all,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(NetworkIcons.arrow_long_left, color: Colors.white, size: 15,),
          // leftChevronIcon: Transform.rotate(
          //     angle: 3.14,
          //     child:
          //     Icon(NetworkIcons.arrow_right_long, color: Colors.white,)
          // ),
          rightChevronIcon: Icon(NetworkIcons.arrow_long_right, color: Colors.white, size: 15,),
        ),
        // calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        // onFormatChanged: (format) {
        //   if (_calendarFormat != format) {
        //     setState(() {
        //       _calendarFormat = format;
        //     });
        //   }
        // },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
