import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
//  final bool termsChecked;
  final VoidCallback onPressed;

  const MyCheckBox({this.onPressed});

  @override
  _MyCheckBoxState createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool termsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: termsChecked, onChanged: _setAgreedToTOS);
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      termsChecked = newValue;
    });
    if (termsChecked) {
      print('item was checked!');
      // widget.onPressed;
    }
  }
}
