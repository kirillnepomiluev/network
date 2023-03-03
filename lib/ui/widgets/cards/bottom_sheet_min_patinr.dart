// ignore_for_file: cascade_invocations
import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';

class BottomSheetMinPaint extends CustomPainter {

  BottomSheetMinPaint({this.color});
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3595147, size.height * 0.2597538);
    path_0.cubicTo(size.width * 0.3422027, size.height * 0.1122728,
        size.width * 0.3226800, 0, size.width * 0.3019493, 0,);
    path_0.lineTo(size.width * 0.08000000, 0);
    path_0.cubicTo(size.width * 0.03581733, 0, 0, size.height * 0.4631552, 0,
        size.height * 1.034483,);
    path_0.lineTo(0, size.height * 23.20690);
    path_0.cubicTo(
        0,
        size.height * 23.77824,
        size.width * 0.03581733,
        size.height * 24.24138,
        size.width * 0.08000000,
        size.height * 24.24138,);
    path_0.lineTo(size.width * 0.9200000, size.height * 24.24138);
    path_0.cubicTo(size.width * 0.9641840, size.height * 24.24138, size.width,
        size.height * 23.77824, size.width, size.height * 23.20690,);
    path_0.lineTo(size.width, size.height * 1.034483);
    path_0.cubicTo(size.width, size.height * 0.4631552, size.width * 0.9641840,
        0, size.width * 0.9200000, 0,);
    path_0.lineTo(size.width * 0.6953840, 0);
    path_0.cubicTo(
        size.width * 0.6746533,
        0,
        size.width * 0.6551307,
        size.height * 0.1122728,
        size.width * 0.6378187,
        size.height * 0.2597534,);
    path_0.cubicTo(
        size.width * 0.6015173,
        size.height * 0.5690138,
        size.width * 0.5525467,
        size.height * 0.7586207,
        size.width * 0.4986667,
        size.height * 0.7586207,);
    path_0.cubicTo(
        size.width * 0.4447867,
        size.height * 0.7586207,
        size.width * 0.3958160,
        size.height * 0.5690138,
        size.width * 0.3595147,
        size.height * 0.2597538,);
    path_0.close();


    Paint paint0Fill = Paint()
      ..color = color ?? AppColors.white10
      ..style = PaintingStyle.fill;
      // ..imageFilter = ImageFilter.blur(sigmaX: blur, sigmaY: blur, tileMode: TileMode.decal)
      // ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01866667;
    paint1Stroke.color = const Color(0xffE2FF2D).withOpacity(1.0);
    paint1Stroke.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(size.width * 0.4560000, size.height * 0.1206897),
        Offset(size.width * 0.5440320, size.height * 0.1206897), paint1Stroke,);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

