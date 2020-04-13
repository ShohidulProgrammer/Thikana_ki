import 'package:flutter/material.dart';

Widget normalTextFormField({
  @required String labelText,
  String hintText,
  TextInputType keyboardType,
  IconData suffixIcon,
  VoidCallback onPressedSuffixIcon,
  TextEditingController textController,
}) {
  return TextFormField(
    controller: textController,
    keyboardType:keyboardType ,
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(suffixIcon),
              onPressed: onPressedSuffixIcon,
            )
          : null,
    ),
  );
}
