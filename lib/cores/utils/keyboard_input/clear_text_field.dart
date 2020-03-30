import 'package:flutter/cupertino.dart';

///On clear text field
Future<void> clearTextField(TextEditingController textController) async {
  await Future.delayed(Duration(milliseconds: 2));
  textController.text = '';
}
