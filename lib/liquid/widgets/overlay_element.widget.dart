import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/services/liquid_friends_controller.dart';
import 'package:liquid_transition_flutter/models/friend.model.dart';

import 'curves_box.widget.dart';

class OverlayElementWidget extends StatefulWidget {
  final LiquidFriendsController controller;
  final int index;
  final FriendModel friend;
  const OverlayElementWidget(
      {super.key, required this.index, required this.controller, required this.friend});

  @override
  State<OverlayElementWidget> createState() => _OverlayElementWidgetState();
}

class _OverlayElementWidgetState extends State<OverlayElementWidget> {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
      curve: Curves.easeInOutQuad,
      parent: widget.controller.animationController,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSpace = 20 + 32 + 20 + widget.index * (80 + 20);
    double bottomSpace = 20 + 200 + 5;
    print("triggered");

    double heightWidget = size.height - topSpace - bottomSpace + 80 - 80; // bottom space
    return Positioned(
      top: 20 + 32 + 20 + widget.index * (80 + 20) - 20,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          if (_animation.value == 0 || _animation.value == 1) {
            return const SizedBox();
          }

          if (widget.controller.currentFriend != null &&
              widget.controller.currentFriend!.id != widget.friend.id) {
            return const SizedBox();
          }

          double percentage = _animation.value;
          // double translation = pow(percentage, 2) * -4 + 4 * percentage;
          double translation = sin(2 * pi * percentage);
          double topOpacity = (.25 - .85) * percentage + .85;
          return Stack(children: [
            Transform.scale(
                scaleY: 1.04,
                child: Opacity(opacity: .6, child: _buildLayer(topOpacity, size, heightWidget, translation))),
            _buildLayer(topOpacity, size, heightWidget, translation)
          ]);
        },
      ),
    );
  }

  ShaderMask _buildLayer(double topOpacity, Size size, double heightWidget, double translation) {
    return ShaderMask(
        shaderCallback: (rect) {
          return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              widget.friend.color.withOpacity(topOpacity),
              widget.friend.color,
              const Color(0xFFefdaa1)
              // Colors.white.withOpacity(.5)
            ],
            stops: [.2, .5, .8],
          ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
        },
        child: Container(
          clipBehavior: Clip.none,
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
          width: size.width,
          height: heightWidget + 20,
          // color: Colors.red.withOpacity(.5),
          child: Stack(children: [
            Container(
              height: 80,
              transform: Transform.translate(offset: Offset(0, translation * 20)).transform,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            IgnorePointer(
                ignoring: true,
                child: CurvesBoxWidget(
                  percentage: _animation.value,
                  height: heightWidget - 80 * 2,
                  scale: 1.2 + 0.09 * widget.index,
                )),
          ]),
        ));
  }
}
