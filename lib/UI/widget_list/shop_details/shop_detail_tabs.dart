import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/grids/custom_grid_view.dart';

List<Widget> shopDetailPageTabHeaderIcons = [
  Tab(icon: Icon(Icons.shopping_cart, color: Colors.red), text: "Product"),
  Tab(
    icon: Icon(Icons.video_library, color: Colors.red),
    text: "Video",
  ),
  Tab(
      icon: Icon(
        Icons.contacts,
        color: Colors.red,
      ),
      text: "Contact"),
];

List<Widget> shopDetailPageSliverTabBarBodies = [
//  TabBarBody(),
  ImageWithTitleCardGridView(),
  ImageWithTitleCardGridView(),
  ImageWithTitleCardGridView(),
];
