import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/image/image_selector_form_field_camera_gallery.dart';
import '../../../../../commonWidget/keyboard_input/normal_text_form_field.dart';

class ProductEditForm extends StatefulWidget {
  @override
  _ProductEditFormState createState() => _ProductEditFormState();
}

class _ProductEditFormState extends State<ProductEditForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: SingleChildScrollView(
          child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ImageSelectorFormField(
//              onSaved: (img) => widget.newCategory.imgUrl = img.path,
            ),
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
}
