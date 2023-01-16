import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/models/friend.model.dart';

class LiquidFriendsController {
  late AnimationController _controller;
  late List<FriendModel> _friends;

  late FriendModel? _currentFriend;

  List<FriendModel> get friends => _friends;

  AnimationController get animationController => _controller;

  FriendModel? get currentFriend => _currentFriend;

  Future<void> animate(FriendModel friend, VoidCallback callback) async {
    _currentFriend = friend;
    _controller.forward().then((_) {
      _controller.reset();
      _currentFriend = null;
      callback();
    });
  }

  void dispose() {
    _controller.dispose();
  }

  LiquidFriendsController({required SingleTickerProviderStateMixin ticker}) {
    _controller = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 1000),
    );

    _friends = FriendModel.generateFriends(count: 5);
  }
}
