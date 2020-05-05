import 'package:flutter/material.dart';

enum TabItem{ home, wishList, chat, notification, dashBoard}

class BottomTabItemData{
  final String title;
  final IconData icon;
  const BottomTabItemData({@required this.title, @required this.icon});
  static const Map<TabItem, BottomTabItemData> allBottomTabs = {
    TabItem.home: BottomTabItemData(title: 'home', icon: Icons.home),
    TabItem.wishList: BottomTabItemData(title: 'wish_list', icon: Icons.favorite),
    TabItem.chat: BottomTabItemData(title: 'chat', icon: Icons.chat),
    TabItem.notification: BottomTabItemData(title: 'notification', icon: Icons.notifications),
    TabItem.dashBoard: BottomTabItemData(title: 'dash_board', icon: Icons.dashboard),
  };


}

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


