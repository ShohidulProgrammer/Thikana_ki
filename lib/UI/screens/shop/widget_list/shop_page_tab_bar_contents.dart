import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/commonWidget/grids/custom_grid_view.dart';
import 'package:thikana_ki/UI/commonWidget/list/custom_sererator_list_factory.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/product_list_tile.dart';

List<Widget> shopPageTabHeader = [
  Tab(
//      icon: Icon(Icons.category),
      text: "Product/\nService"),
  Tab(
//    icon: Icon(Icons.shopping_cart),
    text: "Video",
  ),
  Tab(
//      icon: Icon(Icons.local_offer),
      text: "Contact"),
];

List<Widget> shopPageTabBarBodies = [
  CustomSeparatorListFactory(
    child: ProductListTile(
      productName: 'Product Name',
      category: "Product Category",
      price: "50 /=",
    ),
  ),
  ImageWithTitleCardGridView(),
  ImageWithTitleCardGridView(),
];
