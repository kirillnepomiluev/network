import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Constants {
  static const String strLoremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Orci pharetra nibh integer id adipiscing odio. Enim faucibus ut vel sit sed. Sit sit neque mi id ornare malesuada sed purus. Amet dolor sed et ornare mauris amet.';

  static const String strLongLoremIpsum = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna netus tempus, quam ut congue egestas. Morbi sapien turpis morbi orci, lectus ultrices egestas egestas lacus. Dictum fermentum mus dolor cras. Luctus tellus tortor, egestas lobortis tellus. Aliquam feugiat vestibulum nunc, tortor. Sed porttitor id risus ipsum tortor. In in et porttitor eu nam proin neque, lectus. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna netus tempus, quam ut congue egestas. Morbi sapien turpis morbi orci, lectus ultrices egestas egestas lacus. Dictum fermentum mus dolor cras. Luctus tellus tortor, egestas lobortis tellus. Aliquam feugiat vestibulum nunc, tortor. Sed porttitor id risus ipsum tortor. In in et porttitor eu nam proin neque, lectus. 

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magna netus tempus, quam ut congue egestas. Morbi sapien turpis morbi orci, lectus ultrices egestas egestas lacus. Dictum fermentum mus dolor cras. Luctus tellus tortor, egestas lobortis tellus. Aliquam feugiat vestibulum nunc, tortor. Sed porttitor id risus ipsum tortor. In in et porttitor eu nam proin neque, lectus. ''';

  static const List<String> hobbiesList = [
    'Чтение',
    'Общение',
    'Мотоциклы',
    'Коллекционирование',
    'Спорт',
    'Дизайн',
    'Автомобили',
    'Компьютерные игры',
    'Кино',
    'Интернет',
    'Сканворды и кроссворды',
    'Писательская деятельность',
    'Живопись',
    'Стенография',
    'Астрология',
    'Паркур',
    'Хореография',
    'Модельный бизнес',
  ];
}

class ConstColor {
  // static const Color salad100 = Color(0xFFE7FE55); //салатовый в 100
  // static const Color salad90 = Color.fromRGBO(231, 254, 05, 0.9); //салатоый

  static const Color salad100 = Color(0xFFFEF10D); //салатовый в 100
  static Color salad90 = const Color(0xFFFEF10D).withOpacity(0.9); //салатоый

  static const Color darkSalad = Color(0xFF3E4C14); //темно-салатовый
  static Color halfDarkSalad =
      const Color(0xFF3E4C14).withOpacity(0.4); //темно-салатовый

  // static Color white10 = Colors.white.withOpacity(0.1); //Полупрозрачный белый
  static Color white05 = Colors.white.withOpacity(0.05); //Полупрозрачный белый
  static Color white10 = Colors.white.withOpacity(0.1); //Полупрозрачный белый
  static Color white15 = Colors.white.withOpacity(0.15); //Полупрозрачный белый
  static Color black15 = Colors.black.withOpacity(0.7); //Полупрозрачный чёрный

  static const Color grey = Color(0xFFA9A9A9); //серый
  static const Color textGray = Color(0xFFBDBABA); //серый
  static const Color textWhite = Colors.white; //серый
  static const Color textBlack = Colors.black; //серый
  static const Color grey3 = Color(0xFF828282); //серый3
  // static const Color blackBack = Color(0xFF0F1511);
  static const Color blackBack = Colors.black;
  static const Color black1A = Color(0xFF1A1B19);

}

void showSimpleDialog(
    {required String title,
    required String text,
    required BuildContext context,
    bool barrier = false}) {
  showDialog<void>(
      barrierDismissible: !barrier,
      context: context,
      builder: (BuildContext context) =>
          simpleDialog(title, text, context, barrier));
}

Widget simpleDialog(
    String title, String text, BuildContext context, bool barrier) {
  return AlertDialog(
    actionsPadding: const EdgeInsets.only(right: 20, bottom: 10),
    title: Text(title,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w400, fontSize: 16,
        )),

    content: barrier
        ? null
        : Padding(
            padding: const EdgeInsets.all(1.0),
            child: Text(text,
                textAlign: TextAlign.center,
                maxLines: 10,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.black))),

    actions: [
      Center(
        child: barrier
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: const Text("Ок")),
      )
    ],
  );
}

double getResSize(num value) {
  double responSize = 30;

  switch (value) {
    case 10:
      responSize = 14.sp;
      break;
    case 12:
      responSize = 15.5.sp;
      break;
    case 14:
      responSize = 16.5.sp;
      break;
    case 15:
      responSize = 16.5.sp;
      break;
    case 16:
      responSize = 17.5.sp;
      break;
    case 18:
      responSize = 18.5.sp;
      break;
    case 20:
      responSize = 19.5.sp;
      break;
    case 21:
      responSize = 20.sp;
      break;
    case 24:
      responSize = 21.5.sp;
      break;
    case 32:
      responSize = 24.sp;
      break;
    case 57:
      responSize = 30.sp;
      break;


  }

  return responSize;
}
