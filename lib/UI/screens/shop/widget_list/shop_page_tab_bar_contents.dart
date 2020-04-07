import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/commonWidget/grids/custom_grid_view.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/contact_shop.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/products_in_shop.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/shop_video_item.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/video_example.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/video_list.dart';

import 'video_url_list.dart';

List<Widget> shopPageTabHeader = [
  Tab(
//      icon: Icon(Icons.category),
      text: "Product/Service"),
  Tab(
//    icon: Icon(Icons.shopping_cart),
    text: "Video",
  ),
  Tab(
//      icon: Icon(Icons.local_offer),
      text: "Contact"),
];

List<Widget> shopPageTabBarBodies = [
  ProductsInShop(),
  VideoList(),
//  ImageWithTitleCardGridView(),
  ContactShop(),
];
