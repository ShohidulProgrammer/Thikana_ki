import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/style/text_field_style.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'package:thikana_ki/cores/utils/validation/i_validation.dart';
import 'package:thikana_ki/cores/utils/validation/empty_validator.dart';
import 'package:thikana_ki/cores/utils/validation/validator.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final ValueChanged<String> onFieldSubmitted;
  final Function onEditingComplete;
  final Icon icon;
  final Icon suffixIcon;
  final Color backgroundColor;
  final double borderRadius;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String errorText;
  final int maxLines;
  final FocusNode currentFocus;
  final FocusNode nextFocus;
  final double padding;
  final VoidCallback onTapIcon;
  final VoidCallback onTapSuffixIcon;
  final GestureTapCallback onTap;
  final IValidator iValidator;
  final bool allowEmptyField;

  CustomTextFormField({
    Key key,
    this.hintText,
    this.controller,
    this.onTapIcon,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.iValidator,
    this.allowEmptyField: false,
    this.currentFocus,
    this.nextFocus,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.icon,
    this.suffixIcon,
    this.onTapSuffixIcon,
    this.backgroundColor,
    this.borderRadius: 10.0,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction: TextInputAction.next,
    this.errorText,
    this.maxLines = 1,
    this.padding: 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.only(bottom: 2.0),
      alignment: Alignment.center,
//      decoration: BoxDecoration(
//        color: widget.backgroundColor ?? Colors.blueGrey[50],
////            Theme.of(context).dividerColor,
//        borderRadius: BorderRadius.circular(widget.borderRadius),
//      ),
      child: TextFormField(
        controller: controller,
        onEditingComplete: () => InputFocusChanger.fieldFocusChange(
            context, currentFocus, nextFocus),
        onSaved: onSaved,
        validator: (value) => _validator(value, context),
//        onChanged: _validator,
        focusNode: currentFocus,
        onFieldSubmitted: onFieldSubmitted,
        maxLines: maxLines,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        decoration: CommonStyle.textFieldStyle(
          hintText: Translate.of(context).translate(hintText),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
          onTapSuffixIcon: onTapSuffixIcon,
        ),
      ),
    );
  }

  // Field validation
  String _validator(String text, BuildContext context) {
    String errorText = checkValidity(
        iValidator: iValidator ?? EmptyValidator(allowEmpty: allowEmptyField),
        value: text);
    print('_validator Error text: $errorText');

    return errorText == null
        ? null
        : Translate.of(context).translate(errorText);
  }

//  Widget _buildErrorLabel(BuildContext context) {
//    return ErrorMsg(errorText: errorText);
//  }
}
