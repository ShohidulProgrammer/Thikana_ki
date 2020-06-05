import 'package:flutter/material.dart';

TextFormField normalTextFormField({
  @required String labelText,
  String hintText,
  TextInputType keyboardType,
  IconData suffixIcon,
  VoidCallback onPressedSuffixIcon,
  TextEditingController textController,
  Function onSaved,
}) {
  return TextFormField(
    controller: textController,
    onSaved: onSaved,
    keyboardType: keyboardType,
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
