import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/cores/utils/image/image_picker.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import '../../../../../commonWidget/keyboard_input/normal_text_form_field.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
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
                    context: context, child: imageSourceTypeListTitle()),
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
            ),
          )
        : InkWell(
            onTap: () => customBottomSheet(
                context: context, child: imageSourceTypeListTitle()),
            child: Image.file(
              _image,
              width: UIScreenSize.size.width / 2,
//            height: 200,
            ),
          );
  }

  Future<void> _getImage(ImageSource imageSource) async {
    _image = await getImage(imageSource);
    setState(() {});
  }

  Widget imageSourceTypeListTitle() {
    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text('Gallery Image'),
              onTap: () {
                Navigator.pop(context);
                _getImage(ImageSource.gallery);
              }),
          new ListTile(
              leading: new Icon(Icons.camera_enhance),
              title: new Text('Take Photo'),
              onTap: () {
                Navigator.pop(context);
                _getImage(ImageSource.camera);
              }),
        ],
      ),
    );
  }
}
