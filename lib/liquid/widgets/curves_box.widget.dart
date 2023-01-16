import 'dart:math';

import 'package:flutter/material.dart';

import 'curves_painter.dart';

class CurvesBoxWidget extends StatefulWidget {
  final double percentage;
  final double height;
  final double scale;
  const CurvesBoxWidget({super.key, required this.percentage, required this.height, this.scale = 1.05});

  @override
  State<CurvesBoxWidget> createState() => _CurvesBoxWidgetState();
}

class _CurvesBoxWidgetState extends State<CurvesBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        children: [
          Container(
            height: (widget.percentage > .5) ? 80 : (80 * widget.percentage * 2 + 10),
          ),
          Transform.scale(
            scaleY: widget.scale,
            child: SizedBox(
              height: widget.percentage * widget.height,
              child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.antiAlias,
                children: [
                  CustomPaint(
                    painter: CurvePainter(animation: widget.percentage),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(pi),
                    child: InkWell(
                      onTap: () {
                        // _controller.forward().then((value) => _controller.reverse());
                      },
                      child: CustomPaint(
                        painter: CurvePainter(animation: widget.percentage),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.scale(
            scaleY: widget.percentage > .8 ? ((-3 / 2) * widget.percentage + 7 / 2 - 3 / 2) : 1.0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
