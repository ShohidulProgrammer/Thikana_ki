import 'package:flutter/material.dart';

class BorderLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const BorderLine({Key key, this.width: 250.0, this.height: 1.0, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: width,
      height: height,
      color: color ?? Colors.grey[400],
    );
  }
}
