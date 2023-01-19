import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:liquid_transition_flutter/liquid/services/liquid_friends_controller.dart';
import 'package:liquid_transition_flutter/liquid/widgets/avatar.widget.dart';

class OverlayAvatarsWidget extends StatefulWidget {
  final LiquidFriendsController controller;
  const OverlayAvatarsWidget({super.key, required this.controller});

  @override
  State<OverlayAvatarsWidget> createState() => _OverlayAvatarsWidgetState();
}

class _OverlayAvatarsWidgetState extends State<OverlayAvatarsWidget> {
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: 0.0, end: 1)
        .animate(CurvedAnimation(parent: widget.controller.animationController, curve: Curves.easeInSine));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSpace = 20 + 32 + 20;
    double bottomSpace = 20 + 100;
    double heightWidget = size.height - topSpace - bottomSpace;
    return Positioned(
      top: topSpace,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedBuilder(
          animation: _animation,
          builder: ((context, child) {
            return Container(
              height: size.height - topSpace - bottomSpace,
              width: size.width,
              child: Stack(
                  children: widget.controller.friends.map((friend) {
                if (_animation.value == 0 || _animation.value == 1) {
                  return const SizedBox();
                }

                if (widget.controller.currentFriend != null &&
                    widget.controller.currentFriend!.id != friend.id) {
                  return const SizedBox();
                }

                double leftPosition = (size.width / 2 - 28 - 40) * _animation.value + 40;
                double topPosition = 10 + widget.controller.friends.indexOf(friend) * (80 + 20);

                topPosition = (heightWidget - 28 * 2 - topPosition) * _animation.value + topPosition;

                return Positioned(
                  left: leftPosition,
                  top: topPosition,
                  child: Transform.scale(
                    scale: 1 + (_animation.value) * .4,
                    child: AvatarWidget(
                      friend: friend,
                    ),
                  ),
                );
              }).toList()),
            );
          }),
        ),
      ),
    );
  }
}
