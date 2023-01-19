import 'package:flutter/material.dart';

class FriendModel {
  String id;
  String name;
  String avatar;
  Color color;

  FriendModel({required this.id, required this.name, required this.avatar, this.color = Colors.white});

  FriendModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        avatar = json['avatar'],
        color = Colors.white;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
        'color': 'white',
      };

  // generator of random friends
  static List<FriendModel> generateFriends({int count = 10}) {
    final List<Color> colors = [
      const Color(0xFFC8DDBD),
      const Color(0xFFD0CADC),
      const Color(0xFFEBD2CE),
      const Color(0xFFF3ECD0),
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.cyan,
      Colors.lime,
      Colors.indigo,
      Colors.brown,
      Colors.grey,
      Colors.amber,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.lightBlue,
      Colors.lightGreen,
      Colors.lime,
      Colors.blueGrey,
    ];
    final List<FriendModel> friends = [];
    for (var i = 0; i < count; i++) {
      friends.add(FriendModel(
          id: i.toString(), name: 'Friend $i', avatar: 'https://i.pravatar.cc/150?img=$i', color: colors[i]));
    }
    return friends;
  }
}
