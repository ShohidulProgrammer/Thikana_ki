import 'package:flutter/material.dart';

TabBar customTabBarHeader({List<Widget> tabHeaders}) {
  return TabBar(
//        isScrollable: true,
    labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
    indicatorColor: Colors.red,
    labelColor: Colors.blueGrey[900],
    unselectedLabelColor: Colors.blueGrey[300],
    tabs: tabHeaders.map((tab) => tab).toList(),
  );
}