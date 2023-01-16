import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/widgets/curves_box.widget.dart';
import 'package:local_hero/local_hero.dart';

class OverlayContentWidget extends StatefulWidget {
  final Animation<double> animation;
  const OverlayContentWidget({super.key, required this.animation});

  @override
  State<OverlayContentWidget> createState() => _OverlayContentWidgetState();
}

class _OverlayContentWidgetState extends State<OverlayContentWidget> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = widget.animation;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double percentage = _animation.value;
        // double translation = pow(percentage, 2) * -4 + 4 * percentage;
        double translation = sin(2 * pi * percentage);

        return ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFC8DDBD),
                // Color(0xFFC8DDBD).withOpacity(percentage),
                Color(0xFFefdaa1)
                // Colors.white.withOpacity(.5)
              ],
              stops: [.5, .8],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          child: Stack(
            children: [
              Container(
                height: 80,
                transform: Transform.translate(offset: Offset(0, translation * 5)).transform,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              CurvesBoxWidget(percentage: percentage, height: 100),
              Align(
                  alignment: percentage > 0 ? Alignment.bottomCenter : Alignment.topLeft,
                  child: const LocalHero(
                      tag: "avatar",
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: CircleAvatar(
                          radius: 25,
                        ),
                      ))),
            ],
          ),
        );
      },
    );
  }
}
