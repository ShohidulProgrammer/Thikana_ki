import 'package:flutter/cupertino.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/normal_text_form_field.dart';

editShopTitle({@required BuildContext context, String title, String labelText, String hintText}) {
  DialogUtils.showCustomDialog(context,
      title: title,
      okBtnText: "Save",
      cancelBtnText: "Cancel",
      child: normalTextFormField(labelText: labelText, hintText: hintText),
      /* call method in which you have write your logic and save process  */
      okBtnFunction: () => {});
}