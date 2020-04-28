import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

class BorderLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const BorderLine({Key key, this.width: double.infinity, this.height: 1.0, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: width,
      height: height,
      color: color ?? Colors.blueGrey[100],
    );
  }
}
