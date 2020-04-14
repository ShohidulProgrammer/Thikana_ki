import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thikana_ki/cores/utils/image/image_picker.dart';

class ImageSourceTypeSelectorForm extends StatefulWidget {
  @override
  _ImageSourceTypeSelectorFormState createState() => _ImageSourceTypeSelectorFormState();
}

class _ImageSourceTypeSelectorFormState extends State<ImageSourceTypeSelectorForm> {
  File _image;
  @override
  Widget build(BuildContext context) {
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

  Future<void> _getImage(ImageSource imageSource) async {
    _image = await getImage(imageSource);
    setState(() {});
  }
}
