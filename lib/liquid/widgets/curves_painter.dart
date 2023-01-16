import 'dart:math';

import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final double animation;

  CurvePainter({required this.animation});

  _drawDrip(Path path, double center, Size size, double cHeight, double cWidth) {
    double width = size.width;
    double height = size.height;
    double curveHeight = animation < 0.5 ? height * cHeight : height * cHeight * ((1 - animation) * 2);
    double curveWidth = width * cWidth;
    // left Side
    Point startingPoint = Point(center * width - curveWidth / 2, 0);
    Point peakPoint = Point(startingPoint.x + curveWidth / 2, startingPoint.y + curveHeight);
    Point startingControlePoint1 = Point(startingPoint.x + curveWidth / 2, startingPoint.y);
    Point startingControlePoint2 = Point(peakPoint.x - curveWidth / 4, peakPoint.y);

    path.lineTo(startingPoint.x.toDouble(), startingPoint.y.toDouble());

    path.cubicTo(
      startingControlePoint1.x.toDouble(),
      startingControlePoint1.y.toDouble(),
      startingControlePoint2.x.toDouble(),
      startingControlePoint2.y.toDouble(),
      peakPoint.x.toDouble(),
      peakPoint.y.toDouble(),
    );

    // right side
    Point endingPoint = Point(startingPoint.x + curveWidth, startingPoint.y);
    Point endingControlPoint1 = Point(peakPoint.x + curveWidth / 4, peakPoint.y);
    Point endingControlPoint2 = Point(endingPoint.x - curveWidth / 2, endingPoint.y);

    path.cubicTo(
      endingControlPoint1.x.toDouble(),
      endingControlPoint1.y.toDouble(),
      endingControlPoint2.x.toDouble(),
      endingControlPoint2.y.toDouble(),
      endingPoint.x.toDouble(),
      endingPoint.y.toDouble(),
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    _drawDrip(path, .15, size, .9, .18);
    _drawDrip(path, .3, size, .6, .1);
    _drawDrip(path, .58, size, .8, .15);
    _drawDrip(path, .8, size, 1, .2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) {
    return oldDelegate.animation != animation;
  }
}
