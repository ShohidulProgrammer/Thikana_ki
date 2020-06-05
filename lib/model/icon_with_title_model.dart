import 'package:flutter/material.dart';

class IconWithTitleModel {
  const IconWithTitleModel(
      {this.title, this.titleColor, this.imgUrl, this.icon, this.iconColor, this.backgroundColor,this.route});

  final String title;
  final Color titleColor;
  final String imgUrl;
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String route;
}
