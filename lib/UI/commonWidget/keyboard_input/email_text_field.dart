import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

import 'login_text_field.dart';

class EmailTextField extends MyFormTextField {
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  EmailTextField({
    this.focusNode,
    this.nextFocusNode,
  }) : super(
          hintText: 'email',
          icon: Icon(Icons.mail_outline),
          type: ValidationType.email,
          keyboardType: TextInputType.emailAddress,
          focusNode: focusNode,
          nextFocusNode: nextFocusNode,
        );
}
