import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';

class ErrorMsg extends StatelessWidget {
  final String errorText;

  const ErrorMsg({@required this.errorText});

  @override
  Widget build(BuildContext context) {
    if (errorText == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 2.0, top: 2.0),
      child: Text(
        Translate.of(context).translate(errorText),
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(color: Theme.of(context).errorColor),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
