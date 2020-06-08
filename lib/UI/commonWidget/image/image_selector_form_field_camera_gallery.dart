import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelectorFormField extends StatefulWidget {
  ImageSelectorFormField({
    Key key,
    this.initialImage,
    this.imageURL = "",
    this.onSaved,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  final File initialImage;
  final String imageURL;

  final void Function(File) onSaved;
  final void Function(File) onChanged;
  final String Function(File) validator;

  @override
  _ImageSelectorFormFieldState createState() => _ImageSelectorFormFieldState();
}

class _ImageSelectorFormFieldState extends State<ImageSelectorFormField> {
  File _imageFile;
  String _imageURL;

  void _setImage(img) {
    if (_imageFile != img && widget.onChanged != null) {
      widget.onChanged(img);
    }
    _imageFile = img;
  }

  @override
  void initState() {
    _imageFile = widget.initialImage;
    _imageURL = widget.imageURL;
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
            imageURL: _imageURL,
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

  Future<File> getImage(ImageSource imageSource) async {
    File image;
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: imageSource);
    setState(() {
      image = File(pickedFile.path);
    });

    if (image != null) {
      return image;
    }
    return null;
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

  // bottom sheet image selector
  Widget _buildImageSourceTypeSelector() {
    return Container(
      child: new Wrap(
        children: <Widget>[
          new ListTile(
              leading: new Icon(Icons.photo_library),
              title: new Text('Gallery Image'),
              onTap: () async {
                Navigator.pop(context);
                await getImage(ImageSource.gallery).then((img) {
                  _imageFile = img;
                  widget.setImage(img);
                });
                setState(() {});
              }),
          new ListTile(
              leading: new Icon(Icons.camera_enhance),
              title: new Text('Take Photo'),
              onTap: () async {
                Navigator.pop(context);
                await getImage(ImageSource.camera).then((img) {
                  _imageFile = img;
                  widget.setImage(img);
                });
                setState(() {});
              }),
        ],
      ),
    );
  }
}
