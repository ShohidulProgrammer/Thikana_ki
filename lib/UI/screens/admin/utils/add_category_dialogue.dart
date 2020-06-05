import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialogue_utils.dart';
import 'package:thikana_ki/UI/screens/admin/model/category_model.dart';
import 'package:thikana_ki/UI/screens/admin/widgets/cateogry_edit_form.dart';

void addCategoryDialogue(
    {@required BuildContext context, String title, String okBtnTxt: 'Save'}) {
  CategoryModel category = new CategoryModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  DialogueUtils.showCustomDialogue(
    context,
    title: title,
    okBtnText:  okBtnTxt,
    cancelBtnText: "Cancel",
    child: CategoryEditForm(
      newCategory: category,
      formKey: _formKey,
    ),
    /* call method in which you have write your logic and save process  */
    okBtnFunction: () => _submitForm(_formKey, category),
  );
}

void _submitForm(GlobalKey<FormState> formKey, CategoryModel category) {
  final FormState form = formKey.currentState;
  // here want to access form input data
  form.save();
  print('image: ${category.imgUrl ?? 'no url'} category: ${category.title}');
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
