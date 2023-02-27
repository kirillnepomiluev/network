import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';

class ChooseBirthDateViewModel extends ViewModel {
  ChooseBirthDateViewModel(this.context) {
    date = DateTime(
      DateTime.now().year - 18,
      DateTime.now().month,
      DateTime.now().day,
    );
  }

  final BuildContext context;

  Future<void> onTap() async {
    final newDate = date.toIso8601String();

    UserNotifier().updateData(
      newData: {'hide_age': hideAge, 'birthday_date': newDate},
    );

    context.router.push(const ChooseSexViewRoute());
  }

  bool dateChoosed = false;

  DateTime date = DateTime.now();
  String year = 'YYYY';
  String month = 'MM';
  String day = 'DD';

  Future onPickDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1920),
      lastDate: date,
      // locale: const Locale("ru", "RU"),
      builder: (context, child) => Theme(
        data: ThemeData.dark(),
        child: child!,
      ),
    );

    if (newDate == null) return;

    dateChoosed = true;
    date = newDate;
    year = date.year.toString();
    month = date.month.toString();
    day = date.day.toString();

    notifyListeners();
  }

  bool hideAge = false;
  void onHideAgeCheckBox(bool? newValue) {
    hideAge = newValue!;
    notifyListeners();
  }
}
