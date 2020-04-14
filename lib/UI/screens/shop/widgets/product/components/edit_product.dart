import 'package:flutter/cupertino.dart';
import 'package:thikana_ki/UI/commonWidget/dialog/dialog_utils.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/product/components/add_product_form.dart';

void editProduct({@required BuildContext context, String title, String okBtnTxt: 'Save'}) {
  DialogUtils.showCustomDialog(context,
      title: title,
      okBtnText: okBtnTxt,
      cancelBtnText: "Cancel",
      child: ProductEditForm(),
      /* call method in which you have write your logic and save process  */
      okBtnFunction: () => {});
}