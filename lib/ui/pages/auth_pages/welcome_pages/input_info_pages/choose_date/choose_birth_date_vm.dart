import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:network_app/app/core/providers/notifiers/user_notifier.dart';
import 'package:network_app/app/router/app_router.gr.dart';
import 'package:network_app/ui/widgets/view_model/view_model_data.dart';
import 'package:provider/provider.dart';

class ChooseBirthDateViewModel extends ViewModel {
  ChooseBirthDateViewModel(this.context, this.isAuth) {
    getInit();
  }

  final bool isAuth;

  void getInit(){

    DateTime initDate = DateTime.now();

    if(isAuth)
    {
      date = DateTime(
        initDate.year - 18,
        initDate.month,
        initDate.day,
      );
    }
    else
    {
      final userData = Provider.of<UserNotifier>(context).userData;
      if(userData.birthdayDate!=null){
        initDate = userData.birthdayDate!;
        onDateChoosed(initDate);
      }
    }



  }

  final BuildContext context;

  Future<void> onTap() async {
    final newDate = date.toIso8601String();

    if(isAuth){
      context.router.push(const ChooseSexViewRoute());
      UserNotifier().updateData(
        newData: {'hide_age': hideAge, 'birthday_date': newDate},
      );
    }
    else{

      UserNotifier().updateData(
        newData: {'birthday_date': newDate},
      );
      context.router.pop();
    }
  }

  bool dateChoosed = false;

  DateTime date = DateTime.now();
  String year = 'YYYY';
  String month = 'MM';
  String day = 'DD';

  void onDateChoosed(DateTime newDate){
    dateChoosed = true;
    date = newDate;
    year = date.year.toString();
    month = date.month.toString();
    day = date.day.toString();
  }

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

    onDateChoosed(newDate);

    // dateChoosed = true;
    // date = newDate;
    // year = date.year.toString();
    // month = date.month.toString();
    // day = date.day.toString();

    notifyListeners();
  }

  bool hideAge = false;
  void onHideAgeCheckBox(bool? newValue) {
    hideAge = newValue!;
    notifyListeners();
  }
}
