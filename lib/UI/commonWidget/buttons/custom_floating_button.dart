import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final bool mini;
  final double elevation;

  CustomFloatingButton(
      {this.iconData, this.onPressed, this.mini: true, this.elevation: 1});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        heroTag: null,
        child: Icon(iconData),
        elevation: elevation,
        mini: mini,
        onPressed: onPressed);
  }
}
