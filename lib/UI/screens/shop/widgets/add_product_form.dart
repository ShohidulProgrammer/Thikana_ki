import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/cores/utils/image/image_picker.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import 'shop_text_form_field.dart';

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

            shopTextFormField(labelText: "Product Name *", hintText: 'Lux'),
            shopTextFormField(labelText: "Category Name*", hintText: 'Soap'),
            shopTextFormField(labelText: "Current Price*", hintText: '25'),
            shopTextFormField(labelText: "Regular Price", hintText: '30'),
            shopTextFormField(labelText: "Product Details", hintText: 'Soap'),
            shopTextFormField(labelText: "Keywords", hintText: 'myTag'),
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
