// import 'package:network_app/ui/widgets/network_icons.dart';
// import 'package:network_app/constants.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter/material.dart';
//
//
// class Calendar extends StatefulWidget {
//   const Calendar({super.key});
//
//   @override
//   _CalendarState createState() => _CalendarState();
// }
//
// class _CalendarState extends State<Calendar> {
//
//   final kToday = DateTime.now();
//   DateTime kFirstDay = DateTime.now();
//   DateTime kLastDay = DateTime.now();
//
//
//   @override
//   void initState() {
//     kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
//     kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
//     super.initState();
//   }
//
//   // CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: ConstColor.white10,
//         borderRadius: BorderRadius.circular(12)
//       ),
//       child: TableCalendar<dynamic>(
//         calendarStyle: const CalendarStyle(
//           defaultTextStyle: TextStyle(color: Colors.white),
//           holidayTextStyle: TextStyle(color: Colors.white),
//           weekendTextStyle: TextStyle(color: Colors.white),
//         todayDecoration: BoxDecoration(
//           color: Colors.transparent
//         ),
//         //   defaultDecoration: BoxDecoration(
//         //     shape: BoxShape.circle,
//         //     color: ConstColor.salad100
//         // ),
//           selectedDecoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: ConstColor.salad100
//           ),
//             selectedTextStyle: TextStyle(color: Colors.black),
//         ),
//         firstDay: kFirstDay,
//         lastDay: kLastDay,
//         focusedDay: _focusedDay,
//         locale: 'ru_RU',
//         availableGestures: AvailableGestures.all,
//         headerStyle: const HeaderStyle(
//           formatButtonVisible: false,
//           titleCentered: true,
//           leftChevronIcon: Icon(NetworkIcons.arrow_long_left, color: Colors.white, size: 15,),
//           // leftChevronIcon: Transform.rotate(
//           //     angle: 3.14,
//           //     child:
//           //     Icon(NetworkIcons.arrow_right_long, color: Colors.white,)
//           // ),
//           rightChevronIcon: Icon(NetworkIcons.arrow_long_right, color: Colors.white, size: 15,),
//         ),
//         // calendarFormat: _calendarFormat,
//         selectedDayPredicate: (day) {
//           return isSameDay(_selectedDay, day);
//         },
//         onDaySelected: (selectedDay, focusedDay) {
//           if (!isSameDay(_selectedDay, selectedDay)) {
//             setState(() {
//               _selectedDay = selectedDay;
//               _focusedDay = focusedDay;
//             });
//           }
//         },
//         // onFormatChanged: (format) {
//         //   if (_calendarFormat != format) {
//         //     setState(() {
//         //       _calendarFormat = format;
//         //     });
//         //   }
//         // },
//         onPageChanged: (focusedDay) {
//           _focusedDay = focusedDay;
//         },
//       ),
//     );
//   }
// }
