import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImageHandler {
  //  pick image from gallery or  camera
  static Future<File> pickImage(ImageSource imageSource) async {
    final _picker = ImagePicker();
    final pickedFile = await _picker.getImage(source: imageSource);
    //  returns after  checking  has picked  image
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
