import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/image/image_picker_utils.dart';
import 'package:thikana_ki/UI/commonWidget/image/image_uploader_form_field_utils.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/normal_text_form_field.dart';
import 'package:thikana_ki/UI/screens/admin/model/category_model.dart';
import 'package:image_selector_formfield/image_selector_formfield.dart';

class CategoryEditForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final CategoryModel newCategory;

  CategoryEditForm({Key key, @required this.formKey, this.newCategory})
      : super(key: key);

  @override
  _CategoryEditFormState createState() => _CategoryEditFormState();
}

class _CategoryEditFormState extends State<CategoryEditForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 250,
      child: SingleChildScrollView(
          child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            ImagePickerUtils(),
//
            buildImageSelector(
                onSaved: (img) => widget.newCategory.imgUrl = img.path),

            // text input
            normalTextFormField(
                labelText: "Name*",
                hintText: 'input name',
                onSaved: (val) => widget.newCategory.title = val),
            normalTextFormField(
              labelText: "Keywords",
              hintText: 'myTag',
//                onSaved: (val) => widget.newCategory.tags = val,
            ),
          ],
        ),
      )),
    );
  }
}
