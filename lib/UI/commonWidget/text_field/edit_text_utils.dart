import 'package:flutter/material.dart';

class EditTextUtils {
  TextFormField getCustomEditTextArea({
    String labelText: "",
    String hintText: "",
    TextEditingController controller,
    Function onFieldSubmitted,
    Function onEditingComplete,
    Function onChanged,
    Function onSaved,
    Function validator,
    GlobalKey<FormFieldState<String>> fieldKey,
    TextInputType keyboardType: TextInputType.text,
    TextInputAction textInputAction = TextInputAction.next,
    bool obscureText,
    int maxLines: 1,
    FocusNode focusNode,
    bool autoFocus: false,
//    bool enabled: true,
    TextStyle textStyle,
    InputDecoration decoration,
  }) {
    TextFormField textFormField = TextFormField(
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      maxLines: maxLines,
      obscureText: obscureText,
      autofocus: autoFocus,
      focusNode: focusNode,
      key: fieldKey,
//      enabled: enabled,
      style: textStyle,
      textAlignVertical: TextAlignVertical.center,
      decoration: decoration,
    );
    return textFormField;
  }
}
