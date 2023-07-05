import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';
import 'package:network_app/ui/theme/app_text_styles.dart';
import 'package:network_app/ui/widgets/icons/network_icons.dart';
import 'package:network_app/utils/res.dart';
import 'package:table_calendar/table_calendar.dart';

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

  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Res.s10),
      decoration: BoxDecoration(
          color: AppColors.white10, borderRadius: BorderRadius.circular(12),),
      child: TableCalendar<dynamic>(
        calendarStyle: CalendarStyle(
          defaultTextStyle: AppTextStyles.primary,
          holidayTextStyle: AppTextStyles.primary,
          weekendTextStyle: AppTextStyles.primary,
          todayDecoration: const BoxDecoration(color: Colors.transparent),
          selectedDecoration:
              const BoxDecoration(shape: BoxShape.circle, color: AppColors.salad),
          selectedTextStyle: AppTextStyles.black,
        ),
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        locale: 'ru_RU',
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(
            NetworkIcons.arrow_long_left,
            color: Colors.white,
            size: Res.s15,
          ),
          rightChevronIcon: Icon(
            NetworkIcons.arrow_long_right,
            color: Colors.white,
            size: Res.s15,
          ),
        ),
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
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
