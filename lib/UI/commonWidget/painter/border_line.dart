import 'package:flutter/material.dart';

class BorderLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const BorderLine({this.width, this.height: 1.0, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      color: color ?? Colors.blueGrey[100],
    );
  }
}
