import 'package:responsive_sizer/responsive_sizer.dart';

class UtilsResponsive{
  static double getResSize(num value) {
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
}