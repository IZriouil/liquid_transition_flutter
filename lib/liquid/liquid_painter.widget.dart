import 'package:flutter/material.dart';

class LiquidPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, size.height);
    path.cubicTo(
        size.width / 4, size.height * 3 / 4, size.width / 2, size.height / 4, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
