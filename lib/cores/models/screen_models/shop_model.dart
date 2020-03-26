

import 'package:flutter/material.dart';

class ShopModel {
  const ShopModel({this.title,this.category,this.imgUrl, this.icon, this.color});

  final String title;
  final String category;
  final String imgUrl;
  final IconData icon;
  final Color color;
}

const List<ShopModel> shops = const <ShopModel>[
  const ShopModel(title: 'Car', icon: Icons.directions_car,color: Colors.blueGrey),
  const ShopModel(title: 'Bicycle', icon: Icons.directions_bike, color: Colors.green),
  const ShopModel(title: 'Boat', icon: Icons.directions_boat, color: Colors.orange),
  const ShopModel(title: 'Bus', icon: Icons.directions_bus, color: Colors.greenAccent),
  const ShopModel(title: 'Train', icon: Icons.directions_railway, color: Colors.red),
  const ShopModel(title: 'Walk', icon: Icons.directions_walk, color: Colors.cyan),
  const ShopModel(title: 'Car', icon: Icons.directions_car, color: Colors.yellow),
  const ShopModel(title: 'Bicycle', icon: Icons.drafts, color: Colors.deepPurple),
  const ShopModel(title: 'Boat', icon: Icons.dvr, color: Colors.amber),
  const ShopModel(title: 'Bus', icon: Icons.copyright, color: Colors.brown),
  const ShopModel(title: 'Train', icon: Icons.cloud_off, color: Colors.lightBlue),
  const ShopModel(title: 'Car', icon: Icons.directions_car, color: Colors.brown),
  const ShopModel(title: 'Bicycle', icon: Icons.directions_bike, color: Colors.lime),
  const ShopModel(title: 'Boat', icon: Icons.directions_boat, color: Colors.purpleAccent),
  const ShopModel(title: 'Bus', icon: Icons.directions_bus, color: Colors.deepPurple),
  const ShopModel(title: 'Train', icon: Icons.directions_railway, color: Colors.pink),
  const ShopModel(title: 'Walk', icon: Icons.directions_walk, color: Colors.blueGrey),
  const ShopModel(title: 'Car', icon: Icons.directions_car, color: Colors.blueGrey),
  const ShopModel(title: 'Bicycle', icon: Icons.drafts, color: Colors.blueGrey),
  const ShopModel(title: 'Boat', icon: Icons.dvr, color: Colors.blueGrey),
  const ShopModel(title: 'Bus', icon: Icons.copyright, color: Colors.blueGrey),
  const ShopModel(title: 'Train', icon: Icons.cloud_off, color: Colors.blueGrey),
  const ShopModel(title: 'Car', icon: Icons.directions_car, color: Colors.blueGrey),
  const ShopModel(title: 'Bicycle', icon: Icons.directions_bike, color: Colors.blueGrey),
  const ShopModel(title: 'Boat', icon: Icons.directions_boat, color: Colors.blueGrey),
  const ShopModel(title: 'Bus', icon: Icons.directions_bus, color: Colors.blueGrey),
  const ShopModel(title: 'Train', icon: Icons.directions_railway, color: Colors.blueGrey),
  const ShopModel(title: 'Walk', icon: Icons.directions_walk, color: Colors.blueGrey),
  const ShopModel(title: 'Car', icon: Icons.directions_car, color: Colors.blueGrey),
  const ShopModel(title: 'Bicycle', icon: Icons.drafts, color: Colors.blueGrey),
  const ShopModel(title: 'Boat', icon: Icons.dvr, color: Colors.blueGrey),
  const ShopModel(title: 'Bus', icon: Icons.copyright, color: Colors.blueGrey),
  const ShopModel(title: 'Train', icon: Icons.cloud_off, color: Colors.blueGrey),
];

