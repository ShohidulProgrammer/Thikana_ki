import 'package:flutter/material.dart';
import 'package:thikana_ki/model/icon_with_title_model.dart';

const List<IconWithTitleModel> dashBoardMenuList = const <IconWithTitleModel>[
  const IconWithTitleModel(
    title: 'Add Category',
    icon: Icons.category,
    backgroundColor: Colors.red,
  ),
  const IconWithTitleModel(
      title: 'Add Online Shop',
      icon: Icons.shopping_cart,
      backgroundColor: Colors.green),
  const IconWithTitleModel(
      title: 'Add Discount Shop',
      icon: Icons.local_offer,
      backgroundColor: Colors.orange),
  const IconWithTitleModel(
      title: 'Bus',
      icon: Icons.directions_bus,
      backgroundColor: Colors.greenAccent),
  const IconWithTitleModel(
      title: 'Train',
      icon: Icons.directions_railway,
      backgroundColor: Colors.red),
  const IconWithTitleModel(
      title: 'Walk', icon: Icons.directions_walk, backgroundColor: Colors.cyan),
  const IconWithTitleModel(
      title: 'Car', icon: Icons.directions_car, backgroundColor: Colors.amberAccent),
  const IconWithTitleModel(
      title: 'Bicycle', icon: Icons.drafts, backgroundColor: Colors.deepPurple),
  const IconWithTitleModel(
      title: 'Boat', icon: Icons.dvr, backgroundColor: Colors.indigo),
];
