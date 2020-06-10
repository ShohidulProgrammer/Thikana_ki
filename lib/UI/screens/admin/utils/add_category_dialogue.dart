import 'dart:io';

import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialogue_utils.dart';
import 'package:thikana_ki/UI/screens/admin/model/category_model.dart';
import 'package:thikana_ki/UI/screens/admin/widgets/cateogry_edit_form.dart';
import 'package:thikana_ki/cores/firebase_api/ensure_login.dart';
import 'package:thikana_ki/cores/firebase_api/image_storage.dart';

void addCategoryDialogue(
    {@required BuildContext context,
    String alertTitle,
    String okBtnTxt: 'Save'}) {
  CategoryModel category = new CategoryModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DialogueUtils.showCustomDialogue(
    context,
    title: alertTitle,
    okBtnText: okBtnTxt,
    cancelBtnText: "Cancel",
    child: CategoryEditForm(
      newCategory: category,
      formKey: _formKey,
    ),
    /* call method in which you have write your logic and save process  */
    okBtnFunction: () => _submitForm(
        formKey: _formKey, category: category, collection: alertTitle),
  );
}

void _submitForm(
    {@required GlobalKey<FormState> formKey,
    @required CategoryModel category,
    String collection}) {
  formKey.currentState.save();
  print('image: ${category.imgUrl ?? 'no url'} category: ${category.title}');

  // remove word Add and white space
  collection = collection.replaceAll("Add ", "").replaceAll(" ", "");
  print('Collection: $collection');

  ensureLoggedIn();

  uploadImage(
      collection: collection,
      image: File(category.imgUrl),
      imgName: category.title);
}

//void _submitForm() {
//  final FormState form = _formKey.currentState;
//
//  if (!form.validate()) {
//    showMessage('Form is not valid!  Please review and correct.');
//  } else {
//    form.save(); //This invokes each onSaved event
//
//    print('Form save called, newContact is now up to date...');
//    print('Name: ${newCategory.title}');
//    print('========================================');
//    print('Submitting to back end...');
//    print('TODO - we will write the submission part next...');
//  }
//}

void showMessage(String message, [MaterialColor color = Colors.red]) {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _scaffoldKey.currentState.showSnackBar(
      new SnackBar(backgroundColor: color, content: new Text(message)));
}
