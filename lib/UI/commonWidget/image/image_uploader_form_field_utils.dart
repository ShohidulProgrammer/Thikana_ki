
import 'package:flutter/material.dart';
import 'package:image_selector_formfield/image_selector_formfield.dart';

Widget buildImageSelector({@required Function onSaved}) {
  return ImageSelectorFormField(
    cropStyle: CropStyle.circle,
    icon: Icon(
      Icons.add_photo_alternate,
      size: 100,
      color: Colors.white,
    ),
    backgroundColor: Colors.teal,
    errorTextStyle: TextStyle(color: Colors.red),
    onSaved: onSaved,
    validator: (img) {
      print("validator EJECUTADO");
      return "Error Text";
    },

    cropRatioX: 16,
    cropRatioY: 9,
  );
}