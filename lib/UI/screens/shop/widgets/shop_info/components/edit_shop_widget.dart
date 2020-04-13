import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';

editShopInfo({
  BuildContext context,
  String title,
  Widget child,
}) {
  DialogUtils.showCustomDialog(context,
      title: title,
      okBtnText: "Save",
      cancelBtnText: "Cancel",
      child: child,
      /* call method in which you have write your logic and save process  */
      okBtnFunction: () => {});
}