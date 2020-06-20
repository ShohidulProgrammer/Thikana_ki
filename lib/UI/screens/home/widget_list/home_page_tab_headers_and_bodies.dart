import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/commonWidget/grids/custom_grid_view.dart';


final List<Widget> homePageTabHeaders = [
  Tab(
//      icon: Icon(Icons.category),
      text: "Category"),
  Tab(
//    icon: Icon(Icons.shopping_cart),
    text: "Online Shop",
  ),
  Tab(
//      icon: Icon(Icons.local_offer),
      text: "Discount Shop"),

];


List<Widget> homePageTabBarBodies = [
  ImageWithTitleCardGridView(),
  ImageWithTitleCardGridView(),
  ImageWithTitleCardGridView(),

];

