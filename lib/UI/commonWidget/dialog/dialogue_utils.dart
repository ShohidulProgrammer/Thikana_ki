import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/constants/style_constant.dart';

class DialogueUtils {
  static DialogueUtils _instance = new DialogueUtils.internal();

  DialogueUtils.internal();

  factory DialogueUtils() => _instance;

  static void showCustomDialogue(BuildContext context,
      {String title,
      Widget child,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
//      @required
      Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return Stack(
            children: <Widget>[
              AlertDialog(
                title: Text(title ?? ''),

                /* Here add your custom widget  */
                content: child,
                actions: <Widget>[
                  okBtnText == null
                      ? null
                      : FlatButton(
                          child: Text(okBtnText),
                          onPressed: okBtnFunction,
                        ),
                  cancelBtnText == null
                      ? null
                      : FlatButton(
                          child: Text(cancelBtnText),
                          onPressed: () => Navigator.pop(context))
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(StyleConstant.padding),
                ),
                elevation: 0.0,
              ),
            ],
          );
        });
  }
}
