import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/normal_text_form_field.dart';
import 'package:thikana_ki/UI/screens/admin/model/category_model.dart';
import 'package:thikana_ki/UI/commonWidget/image/image_picker_form_field.dart';

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
    return SingleChildScrollView(
        child: Form(
      key: widget.formKey,
      child: ListBody(
//        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ImagePickerFormField(
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
    ));
  }
}
