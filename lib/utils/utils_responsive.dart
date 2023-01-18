import 'package:responsive_sizer/responsive_sizer.dart';

class UtilsResponsive {
  static double getResSize(num value) {
    double responSize = 30;

    switch (value) {
      case 10:
        responSize = 14.sp;
        break;
      case 11:
        responSize = 15.sp;
        break;
      case 12:
        responSize = 15.5.sp;
        break;
      case 13:
        responSize = 16.sp;
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
      case 17:
        responSize = 18.sp;
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
      case 22:
        responSize = 20.5.sp;
        break;
      case 23:
        responSize = 21.sp;
        break;
      case 24:
        responSize = 21.5.sp;
        break;
      case 25:
        responSize = 22.sp;
        break;
      case 26:
        responSize = 22.5.sp;
        break;
      case 32:
        responSize = 24.sp;
        break;
      case 35:
        responSize = 26.sp;
        break;
      case 38:
        responSize = 27.sp;
        break;
      case 40:
        responSize = 28.sp;
        break;
      case 57:
        responSize = 30.sp;
        break;
      case 60:
        responSize = 33.sp;
        break;
    }

    return responSize;
  }
}
