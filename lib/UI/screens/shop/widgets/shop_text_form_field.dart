import 'package:flutter/material.dart';



Widget shopTextFormField({@required String labelText, String hintText}){
  return TextFormField(
    decoration: InputDecoration(
      labelText: labelText,
      hintText: hintText,
    ),
  );
}