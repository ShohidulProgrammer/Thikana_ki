import 'package:flutter/material.dart';

class BottomNavigationIcon {
  const BottomNavigationIcon({@required this.icon, this.title, this.color});

  final String title;
  final IconData icon;
  final MaterialColor color;
}

const List<BottomNavigationIcon> bottomNavigationIconList =
    <BottomNavigationIcon>[
  BottomNavigationIcon(title: 'home', icon: Icons.home, color: Colors.teal),
  BottomNavigationIcon(
      title: 'wish_list', icon: Icons.favorite, color: Colors.cyan),
  BottomNavigationIcon(title: 'chat', icon: Icons.chat, color: Colors.orange),
  BottomNavigationIcon(
      title: 'notification', icon: Icons.notifications, color: Colors.blue),
  BottomNavigationIcon(
      title: 'dash_board', icon: Icons.dashboard, color: Colors.blue),
];
