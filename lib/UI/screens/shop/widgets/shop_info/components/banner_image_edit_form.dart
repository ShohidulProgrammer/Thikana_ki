import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/bottom_sheet.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/product/components/image_source_type_selector_form.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

class BannerImageEditForm extends StatefulWidget {
  @override
  _BannerImageEditFormState createState() => _BannerImageEditFormState();
}

class _BannerImageEditFormState extends State<BannerImageEditForm> {
  @override
  Widget build(BuildContext context) {
    List<File> _images =  new List(5);
    return Container(
      height: 280.0,
      child: ListView.builder(
          padding: EdgeInsets.all(0.0),
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => customBottomSheet(
                  context: context, child: ImageSourceTypeSelectorForm()),
              child: ListTile(
                leading: _images[index] == null
                    ? Icon(Icons.image)
                    : Image.file(
                        _images[index],
                        width: UIScreenSize.size.width / 4,
//            height: 200,
                      ),
                title: Text(
                  'Banner Image : ${index + 1}',
                ),
              ),
            );
          }),
    );
  }
}
