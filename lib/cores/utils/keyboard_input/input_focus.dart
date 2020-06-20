import 'package:flutter/material.dart';

class InputFocusChanger {
  static fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    next != null
        ? FocusScope.of(context).requestFocus(next)
        : hiddenKeyboard(context);
  }

  static hiddenKeyboard(BuildContext context) {
    FocusManager.instance.primaryFocus.unfocus();
  }

  ///Singleton factory
  static final InputFocusChanger _instance = InputFocusChanger._internal();

  factory InputFocusChanger() {
    return _instance;
  }

  InputFocusChanger._internal();
}
