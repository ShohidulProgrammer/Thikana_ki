import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/cores/utils/image/image_picker.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import '../../../../../commonWidget/keyboard_input/normal_text_form_field.dart';
import 'image_source_type_selector_form.dart';

class ProductEditForm extends StatefulWidget {
  @override
  _ProductEditFormState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends State<ProductEditForm> {
  File _image;
  bool _isImage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SingleChildScrollView(
          child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _buildImage(),
            // text input

            normalTextFormField(labelText: "Product Name *", hintText: 'Lux'),
            normalTextFormField(labelText: "Category Name*", hintText: 'Soap'),
            normalTextFormField(labelText: "Current Price*", hintText: '25'),
            normalTextFormField(labelText: "Regular Price", hintText: '30'),
            normalTextFormField(labelText: "Product Details", hintText: 'Soap'),
            normalTextFormField(labelText: "Keywords", hintText: 'myTag'),
          ],
        ),
      )),
    );
  }

  Widget _buildImage() {
    return _image == null
        ? Container(
            height: 100.0,
            width: 100.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => customBottomSheet(
                    context: context, child: ImageSourceTypeSelectorForm()),
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
            ),
          )
        : InkWell(
            onTap: () => customBottomSheet(
                context: context, child: ImageSourceTypeSelectorForm()),
            child: Image.file(
              _image,
              width: UIScreenSize.size.width / 2,
//            height: 200,
            ),
          );
  }

}
