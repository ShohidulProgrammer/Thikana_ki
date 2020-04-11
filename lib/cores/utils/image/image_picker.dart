import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> getImage(ImageSource imageSource) async {
  return await ImagePicker.pickImage(source: imageSource);
}
