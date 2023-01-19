import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_transition_flutter/liquid/services/liquid_friends_controller.dart';
import 'package:liquid_transition_flutter/models/friend.model.dart';
import 'package:local_hero/local_hero.dart';

import 'avatar.widget.dart';

class MainContentWidget extends StatefulWidget {
  final LiquidFriendsController controller;
  const MainContentWidget({super.key, required this.controller});

  @override
  State<MainContentWidget> createState() => _MainContentWidgetState();
}

class _MainContentWidgetState extends State<MainContentWidget> {
  final List<FriendModel> _selectedFriends = [];
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: 0, end: 1).animate(widget.controller.animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Friends Nearby",
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: widget.controller.friends.length,
              clipBehavior: Clip.none,
              itemBuilder: ((context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF181718),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: () {
                      _addUser(widget.controller.friends[index]);
                    },
                    child: Opacity(
                      opacity: _selectedFriends.contains(widget.controller.friends[index]) ? 0.5 : 1,
                      child: Row(
                        children: [
                          AvatarWidget(friend: widget.controller.friends[index]),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            widget.controller.friends[index].name,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
        ),
        Container(
          width: 80,
          height: 5,
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: ((context, child) {
            return AnimatedScale(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              scale: _animation.value > .4 ? 1.03 : 1,
              child: Container(
                height: 200,
                clipBehavior: Clip.none,
                decoration: BoxDecoration(
                  color: const Color(0xFFefdaa1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ..._selectedFriends.map((friend) {
                            return InkWell(
                              onTap: () {
                                if (mounted) {
                                  setState(() {
                                    _selectedFriends.remove(friend);
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: AvatarWidget(
                                  friend: friend,
                                ),
                              ),
                            );
                          }).toList()
                        ],
                      ),
                      Text(
                        "Invite Friends",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ],
                  ),
                )),
              ),
            );
          }),
        ),
      ],
    );
  }

  void _addUser(FriendModel friend) {
    if (_selectedFriends.contains(friend)) {
      _selectedFriends.remove(friend);
      setState(() {});
    } else {
      widget.controller.animate(friend, () {
        if (mounted) {
          setState(() {
            _selectedFriends.add(friend);
          });
        }
      });
    }
  }
}
