import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';

class FirebaseImageStorage {
  static Future<String> uploadImage(
      {@required String collection,
      @required File image,
      String imgName}) async {
    try {
      final StorageReference imgRef =
          FirebaseStorage.instance.ref().child("$collection");

      var timeKey = DateTime.now();
      var at = timeKey.toString();
      imgName = imgName ?? basename(image.path);

      final StorageUploadTask uploadTask =
          imgRef.child("${imgName}_$at.jpg").putFile(image);

      var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

      String url = imageUrl.toString();

      print("image Url: $url");
      return url;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
