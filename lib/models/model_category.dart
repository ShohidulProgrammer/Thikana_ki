import 'package:flutter/cupertino.dart';
import '../utils/import_utility_path.dart';

class CategoryModel {
  final int id;
  final String title;
  final int count;
  final String image;
  final IconData icon;
  final Color color;
  final String route;

  CategoryModel({
    this.id,
    this.title,
    this.count,
    this.image,
    this.icon,
    this.color,
    this.route,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final icon = UtilIcon.getIconData(json['icon'] ?? "Unknown");
    final color = UtilColor.getColorFromHex(json['color'] ?? "#ff8a65");
    if (json['image'] is Map) {
      json['image'] = "Unknown";
    }
    return CategoryModel(
      id: json['term_id'] as int ?? 0,
      title: json['name'] as String ?? 'Unknown',
      count: json['count'] as int ?? 0,
      image: json['image'] as String ?? 'Unknown',
      icon: icon,
      color: color,
      route: json['route'] as String ?? "Unknown",
    );
  }
}
