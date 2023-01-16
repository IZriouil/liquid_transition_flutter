import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_pravatar/flutter_pravatar.dart';
import 'package:liquid_transition_flutter/models/friend.model.dart';

class AvatarWidget extends StatelessWidget {
  final FriendModel friend;

  const AvatarWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: friend.color,
        radius: 28,

        // foregroundImage: NetworkImage(friend.avatar),
        child: CircleAvatar(backgroundImage: NetworkImage(friend.avatar), radius: 25));
  }
}
