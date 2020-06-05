import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/UI/screens/admin/model/category_model.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

class ImagePickerUtils extends StatefulWidget {
  final Function onSaved;
  final String imgUrl;

  const ImagePickerUtils({Key key, this.onSaved, this.imgUrl})
      : super(key: key);

  @override
  _ImagePickerUtilsState createState() => _ImagePickerUtilsState();
}

class _ImagePickerUtilsState extends State<ImagePickerUtils> {
  File _image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return _image == null
        ? Container(
            height: 100.0,
            width: 100.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => customBottomSheet(
                    context: context, child: _buildImageSourceTypeSelector()),
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
            ),
          )
        : InkWell(
            onTap: () => customBottomSheet(
                context: context, child: _buildImageSourceTypeSelector()),
            child: Image.file(
              _image,
              width: UIScreenSize.size.width / 2,
//            height: 200,
            ),
          );
    ;
  }

  Widget _buildImageSourceTypeSelector() {
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

  Future _getImage(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      _image = File(pickedFile.path);

      try {
//        widget.imgUrl = _image.path ?? 'no url';
        print('\n\n\n\nmy image url: ${_image.path }');
      } catch (e) {
        print('\n\n\nimage error: $e');
      }
    });
  }
}
