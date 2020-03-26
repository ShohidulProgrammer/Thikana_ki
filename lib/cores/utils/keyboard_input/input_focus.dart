import 'package:flutter/material.dart';

class InputFocusChanger {
  static fieldFocusChange(
      BuildContext context,
      FocusNode current,
      FocusNode next,
      ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static hiddenKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  ///Singleton factory
  static final InputFocusChanger _instance = InputFocusChanger._internal();

  factory InputFocusChanger() {
    return _instance;
  }

  InputFocusChanger._internal();
}
