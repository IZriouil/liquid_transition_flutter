import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/widgets/main_content.widget.dart';
import 'package:liquid_transition_flutter/liquid/widgets/overlay_content.widget.dart';
import 'package:local_hero/local_hero.dart';

class AnimatedMountainPainter extends StatefulWidget {
  const AnimatedMountainPainter({Key? key}) : super(key: key);

  @override
  State<AnimatedMountainPainter> createState() => _AnimatedMountainPainterState();
}

class _AnimatedMountainPainterState extends State<AnimatedMountainPainter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1250),
    );
    _animation = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn.flipped));
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // _controller.forward().then((value) => _controller.reset());
        if (_controller.isCompleted) {
          _controller.reverse();
        } else
          _controller.forward();
        // _controller.forward();
      },
      child: LocalHeroScope(
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
        child: Stack(
          children: [
            // MainContentWidget(
            //     // isClicked: _controller.isCompleted,
            //     ),
            OverlayContentWidget(animation: _animation)
          ],
        ),
      ),
    );
  }
}
