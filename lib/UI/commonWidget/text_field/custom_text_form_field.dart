import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/style/text_field_style.dart';
import 'package:thikana_ki/UI/screens/login/widgets/error_msg.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'edit_text_utils.dart';
import 'package:thikana_ki/cores/utils/validation/i_validation.dart';
import 'package:thikana_ki/cores/utils/validation/empty_validator.dart';
import 'package:thikana_ki/cores/utils/validation/validator.dart';

class CustomTextFormField extends StatefulWidget {
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
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.only(bottom: 2.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.blueGrey[50],
//            Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          EditTextUtils().getCustomEditTextArea(
            hintText: Translate.of(context).translate(widget.hintText),
            controller: widget.controller,
            onEditingComplete: widget.onEditingComplete,
            onSaved: widget.onSaved,
            validator: _validator,
//                onChanged: _validator,
            focusNode: widget.currentFocus,
            onFieldSubmitted: (_) => InputFocusChanger.fieldFocusChange(
                context, widget.currentFocus, widget.nextFocus),
            maxLines: widget.maxLines,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            obscureText: widget.obscureText,
            decoration: CommonStyle.textFieldStyle(
              hintText: Translate.of(context).translate(widget.hintText),
              prefixIcon: widget.icon,
              suffixIcon: widget.suffixIcon,
              onTapSuffixIcon: widget.onTapSuffixIcon,
            ),
          ),
        ],
      ),
    );
  }

  // Field validation
  String _validator(String text) {
    setState(() {
      errorText = '';
      errorText = checkValidity(
          iValidator: widget.iValidator ??
              EmptyValidator(allowEmpty: widget.allowEmptyField),
          value: text);
      print('_validator Error text: $errorText');
    });
    return errorText == null
        ? null
        : Translate.of(context).translate(errorText);
  }

  Widget _buildErrorLabel(BuildContext context) {
    return ErrorMsg(errorText: errorText);
  }
}

//TextFormField(
////            controller: usernameController,
//
//keyboardType: TextInputType.text,
//textInputAction: TextInputAction.next,
//onSaved: onSaved,
//onChanged: onChanged,
//autofocus: true,
//enabled: true,
//controller: controller,
//validator: (String value) =>
//value.isEmpty ? "Field can not be empty!" : null,
////            focusNode: userFocus,
//
//onEditingComplete: onEditingComplete,
//onFieldSubmitted: onFieldSubmitted,
//
////            validator: (value) => emptyValidation(value),
//decoration: CommonStyle.textFieldStyle(
//hintText: Translate.of(context).translate(hintText),
//),
//),
