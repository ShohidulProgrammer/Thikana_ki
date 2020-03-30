import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    String text,
    Color color,
    Color textColor,
    double width,
    double borderRadius,

    VoidCallback onPressed,
  }) : super(
    child: Text(
      text,
      style: TextStyle(color: textColor, fontSize: 15.0),
    ),
    color: color,
    width: width,
    borderRadius: borderRadius,
    onPressed: onPressed,
  );
}
