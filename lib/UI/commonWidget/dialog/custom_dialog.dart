
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/style/style_constant.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;
  CustomDialog({this.child});
//  final String title, description, buttonText;
//  final Image image;
//
//  CustomDialog({
//    @required this.title,
//    @required this.description,
//    @required this.buttonText,
//    this.image,
//  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(StyleConstant.padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: child,
    );
  }
}