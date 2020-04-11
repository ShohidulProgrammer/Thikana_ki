import 'package:flutter/material.dart';

Widget shopTextFormField({
  @required String labelText,
  String hintText,
  IconData suffixIcon,
  VoidCallback onPressedSuffixIcon,
  TextEditingController textController,
}) {
  return TextFormField(
    controller: textController,

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
