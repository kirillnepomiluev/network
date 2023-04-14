import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';

class ChooseMeetingDateViewModel extends ViewModel {
  ChooseMeetingDateViewModel(this.context) {
    getInit();
  }
  final BuildContext context;

  DateTime eventDate = DateTime.now();
  TimeOfDay eventTime = TimeOfDay.fromDateTime(DateTime.now());

  String startDate = '';
  String startTime = '';

  void getInit() {
    eventDate = eventDate.add(const Duration(minutes: 10));
    eventTime = TimeOfDay.fromDateTime(eventDate);
    setDate();
  }

  void setDate() {
    final localizations = MaterialLocalizations.of(context);
    startDate = localizations.formatShortDate(eventDate);
    startTime = localizations.formatTimeOfDay(eventTime);
    notifyListeners();
  }

  Future onPickDate() async {
    final newDate = await showDatePicker(
      helpText: 'Начало встречи',
      context: context,
      initialDate: eventDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
      // locale: const Locale("ru", "RU"),
      builder: (context, child) => Theme(
        data: ThemeData.dark(),
        child: child!,
      ),
    );

    if (newDate == null) return;
    eventDate = newDate;
    setDate();
  }

  Future onPickTime() async {
    final newTime = await showTimePicker(
      helpText: 'Время встречи',
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: eventTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child ?? Container(),
          ),
        );
      },
    );

    if (newTime == null) return;
    eventTime = newTime;
    setDate();
  }

  Future<void> onTap() async {
    final userNotifier = Provider.of<UserNotifier>(context, listen: false);
    final meetingPlaningDate =
        eventDate.add(Duration(hours: eventTime.hour, minutes: eventTime.minute));
    print('requestDate $meetingPlaningDate');
    userNotifier.meetingDraft.meetingPlaningDate = meetingPlaningDate;
    context.router.push(const CheckMeetingParametersViewRoute());
  }
}
