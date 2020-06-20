import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thikana_ki/UI/commonWidget/icon/app_icon.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/cores/utils/validation/i_validation.dart';
import 'package:thikana_ki/cores/utils/validation/password_validation.dart';

class PasswordTextFormField extends StatefulWidget {
  final String hintText;
  final int maxLength;
  final int minLength;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final FormFieldSetter onSaved;
  final Function onFieldSubmitted;
  final Function onEditingComplete;
  final ValueChanged<String> onChanged;
  final TextInputAction textInputAction;
  final IValidator iValidator;
  final TextEditingController controller;
  final GlobalKey<FormFieldState> fieldKey;

  const PasswordTextFormField({
    Key key,
    this.fieldKey,
    this.controller,
    this.hintText: 'password',
    this.currentFocus,
    this.nextFocus,
    this.maxLength,
    this.minLength,
    this.onSaved,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction: TextInputAction.next,
    this.iValidator,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  String errorText;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    
    return CustomTextFormField(
      key: widget.fieldKey,
      controller: widget.controller,
      hintText: widget.hintText,
      currentFocus: widget.currentFocus,
      nextFocus: widget.nextFocus,
      obscureText: _visible,
      textInputAction: widget.textInputAction,
      onSaved: widget.onSaved,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      iValidator: widget.iValidator ?? PasswordValidator(),
      // onChanged: widget.onChanged,

      //  FontAwesomeIcons.lock,
      //          ? Icons.visibility : Icons.visibility_off
      icon: AppIcon(icon: Icons.lock_outline),
      suffixIcon: AppIcon(
        icon: _visible ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,
        size: 15.0,
      ),
      onTapSuffixIcon: hidePassword,
    );
  }

  // hide password visibility
  hidePassword() => setState(() {
        _visible = !_visible;
      });

//  // password validation
//  String _validator(String password) {
//    return checkValidity(iValidator:  PasswordValidator(), value: password);
//  }

}
