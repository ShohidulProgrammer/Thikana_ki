import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

import 'login_text_field.dart';

class PhoneTextField extends LoginTextField {
  PhoneTextField({
    FocusNode focusNode,
    FocusNode nextFocusNode,
  }) : super(
          hintText: 'phone',
          icon: Icon(Icons.phone),
          keyboardType: TextInputType.phone,
          focusNode: focusNode,
          nextFocusNode: nextFocusNode,
        );
}
