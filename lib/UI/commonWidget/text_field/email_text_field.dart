import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/cores/utils/validation/email_validation.dart';

class EmailTextField extends CustomTextFormField {
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final bool allowEmptyField;

  EmailTextField({
    this.currentFocus,
    this.nextFocus,
    this.allowEmptyField,
  }) : super(
          hintText: 'email',
          icon: Icon(Icons.mail_outline),
          keyboardType: TextInputType.emailAddress,
          currentFocus: currentFocus,
          nextFocus: nextFocus,
          iValidator: EmailValidator(),
          allowEmptyField: allowEmptyField,
        );
}
