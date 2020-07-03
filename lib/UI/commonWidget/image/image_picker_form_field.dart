import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/cores/image/image_handler.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerFormField extends StatefulWidget {
  ImagePickerFormField({
    Key key,
    this.initialImage,
    this.imageUrl = "",
    this.onSaved,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final File initialImage;
  final String imageUrl;

  final void Function(File) onSaved;
  final void Function(File) onChanged;
  final String Function(File) validator;

  @override
  _ImagePickerFormFieldState createState() => _ImagePickerFormFieldState();
}

class _ImagePickerFormFieldState extends State<ImagePickerFormField> {
  File _imageFile;
  String _imageUrl;

  void _setImage(img) {
    if (_imageFile != img && widget.onChanged != null) {
      widget.onChanged(img);
    }
    _imageFile = img;
  }

  @override
  void initState() {
    _imageFile = widget.initialImage;
    _imageUrl = widget.imageUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField<File>(onSaved: (_) {
      if (widget.onSaved != null) return widget.onSaved(_imageFile);
      return null;
    }, validator: (_) {
      if (widget.validator != null) return widget.validator(_imageFile);
      return null;
    }, builder: (state) {
      return Column(
        children: <Widget>[
          _InkWidget(
            imageFile: _imageFile,
            imageURL: _imageUrl,
            setImage: _setImage,
            icon: Icon(
              Icons.add_a_photo,
              size: 100,
              color: Colors.white,
            ),
          ),
          state.hasError
              ? Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(state.errorText,
                      style: TextStyle(color: Colors.red)))
              : Container()
        ],
      );
    });
  }
}

class _InkWidget extends StatefulWidget {
  _InkWidget({Key key, this.imageFile, this.imageURL, this.icon, this.setImage})
      : super(key: key);

  final File imageFile;
  final String imageURL;
  final Icon icon;
  final Function(File) setImage;

  @override
  __InkWidgetState createState() => __InkWidgetState();
}

class __InkWidgetState extends State<_InkWidget> {
  File _imageFile;

  @override
  void initState() {
    super.initState();
    if (widget.imageFile != null) {
      _imageFile = widget.imageFile;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (_imageFile == null) &&
            (widget.imageURL == null || widget.imageURL == "")
        ? // img file and url both null
        Container(
            height: 100.0,
            width: 100.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () => customBottomSheet(
                  context: context,
                  child: _buildImageSourceTypeSelector(),
                ),
                tooltip: 'Pick Image',
                child: Icon(Icons.add_a_photo),
              ),
            ),
          )
        : (_imageFile == null) &&
                (widget.imageURL != "" && widget.imageURL != null)
            ? // img file empty but url has network value
            CachedNetworkImage(
                alignment: Alignment.center,
                width: UIScreenSize.size.width / 2,
                imageUrl: widget.imageURL,
                fit: BoxFit.contain,
              )
            : // img file has value
            InkWell(
                onTap: () => customBottomSheet(
                    context: context, child: _buildImageSourceTypeSelector()),
                child: Image.file(
                  _imageFile,
                  width: UIScreenSize.size.width / 2,
                ),
              );
  }

  // bottom sheet image picker  type
  Widget _buildImageSourceTypeSelector() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _imageSourceChooserListTile(
            icon: Icons.image,
            title: 'Gallery Image',
            imageSource: ImageSource.gallery),
        // Divider(),
        _imageSourceChooserListTile(
            icon: Icons.camera_alt,
            title: 'Take Photo',
            imageSource: ImageSource.camera),
        SizedBox(height: 10.0),
      ],
    );
  }

  ListTile _imageSourceChooserListTile(
      {IconData icon, String title, ImageSource imageSource}) {
    return ListTile(
        leading: new Icon(icon),
        title: Align(
          child: new Text(title),
          alignment: Alignment(-1.2, 0),
        ),
        onTap: () async {
          Navigator.pop(context);
          await ImageHandler.pickImage(imageSource).then((img) {
            _imageFile = img;
            widget.setImage(img);
          });
          setState(() {});
        });
  }
}
