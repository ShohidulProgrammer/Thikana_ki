import 'package:flutter/material.dart';

class CommonStyle {
  static InputDecoration textFieldStyle({
//    String labelText = "",
    String hintText = "",
    Icon prefixIcon,
    Icon suffixIcon,
    VoidCallback onTapSuffixIcon,
  }) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(10.0),
      errorMaxLines: 1,
      isDense: true,
//      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: suffixIcon,
              onPressed: onTapSuffixIcon,
            )
          : null,
//      border: InputBorder.none,
      errorStyle: TextStyle(height: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          width: 0,
          style: BorderStyle.none,
        ),
      ),
      filled: true,
      fillColor: Colors.blueGrey[50],
    );
  }
}
