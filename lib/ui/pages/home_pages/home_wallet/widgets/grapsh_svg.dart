import 'package:flutter/material.dart';
import 'package:network_app/ui/theme/app_colors.dart';


class GraphSvg extends CustomPainter {
  final bool isDark;

  GraphSvg({this.isDark = false});

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.006060606, size.height * 0.9000000);
    path_0.cubicTo(
        size.width * 0.01717170,
        size.height * 0.9575764,
        size.width * 0.05393939,
        size.height * 1.038182,
        size.width * 0.1121212,
        size.height * 0.9000000);
    path_0.cubicTo(
        size.width * 0.1848485,
        size.height * 0.7272727,
        size.width * 0.2242424,
        size.height * 0.5363636,
        size.width * 0.3212121,
        size.height * 0.9000000);
    path_0.cubicTo(
        size.width * 0.4181818,
        size.height * 1.263636,
        size.width * 0.3696970,
        size.height * 0.3818218,
        size.width * 0.4515152,
        size.height * 0.2727309);
    path_0.cubicTo(
        size.width * 0.5333333,
        size.height * 0.1636400,
        size.width * 0.4939394,
        size.height * 0.8000036,
        size.width * 0.5787879,
        size.height * 0.7363673);
    path_0.cubicTo(
        size.width * 0.6636364,
        size.height * 0.6727309,
        size.width * 0.6152121,
        size.height * 0.3436545,
        size.width * 0.7121212,
        size.height * 0.3727273);
    path_0.cubicTo(
        size.width * 0.7727273,
        size.height * 0.3909091,
        size.width * 0.7424242,
        size.height * 0.5454545,
        size.width * 0.8151515,
        size.height * 0.5909091);
    path_0.cubicTo(
        size.width * 0.8733333,
        size.height * 0.6272727,
        size.width * 0.9525273,
        size.height * 0.2484855,
        size.width * 0.9848485,
        size.height * 0.05454545);

    Paint paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    paint0Stroke.color = isDark ? AppColors.salad100 : AppColors.black1A;
    // paint_0_stroke.color= Colors.transparent;
    canvas.drawPath(path_0, paint0Stroke);

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    // paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    paint0Fill.color = Colors.transparent;
    canvas.drawPath(path_0, paint0Fill);

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = isDark ? AppColors.salad100 : AppColors.black1A;
    canvas.drawCircle(Offset(size.width * 0.9878788, size.height * 0.03636364),
        size.width * 0.01212121, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}