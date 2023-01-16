import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/services/liquid_friends_controller.dart';
import 'package:liquid_transition_flutter/liquid/widgets/main_content.widget.dart';
import 'package:liquid_transition_flutter/liquid/widgets/overlay_avatars.widget.dart';
import 'package:liquid_transition_flutter/liquid/widgets/overlay_element.widget.dart';

class LiquidApplication extends StatefulWidget {
  const LiquidApplication({super.key});

  @override
  State<LiquidApplication> createState() => _LiquidApplicationState();
}

class _LiquidApplicationState extends State<LiquidApplication> with SingleTickerProviderStateMixin {
  late LiquidFriendsController _controller;

  @override
  void initState() {
    super.initState();
    _controller = LiquidFriendsController(ticker: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: MainContentWidget(controller: _controller)),
          ..._controller.friends
              .map((friend) => OverlayElementWidget(
                    index: _controller.friends.indexOf(friend),
                    controller: _controller,
                    friend: friend,
                  ))
              .toList(),
          OverlayAvatarsWidget(
            controller: _controller,
          )
          // OverlayElementWidget(
          //   animation: _animation,
          //   controller: _controller,
          //   index: 0,
          // )
        ],
      ),
    );
  }
}
