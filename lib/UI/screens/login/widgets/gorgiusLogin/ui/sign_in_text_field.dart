import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_input_field.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

class SignInTextField extends StatefulWidget {
  final String hintText;
  final ValidationType type;
  final Icon icon;

  const SignInTextField(
      {Key key, this.hintText, this.type: ValidationType.normal, this.icon})
      : super(key: key);

  @override
  _SignInTextFieldState createState() => _SignInTextFieldState();
}

class _SignInTextFieldState extends State<SignInTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  String errorText;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextInputField(
      key: _fieldKey,
      hintText: Translate.of(context).translate(widget.hintText),
      errorText:
          errorText != null ? Translate.of(context).translate(errorText) : null,
      focusNode: _focusNode,
      obscureText: _obscureText,
      textInputAction: TextInputAction.next,
      onTapIcon: () =>
          widget.type != ValidationType.password ? clearTextField() : hideText(),
      onSubmitted: (text) {
        InputFocusChanger.fieldFocusChange(context, _focusNode, null);
      },
      onChanged: (text) {
        setState(() {
          errorText = UtilValidator.validate(
            data: _textEditingController.text,
            type: widget.type,
          );
        });
      },
      icon: widget.icon,
      suffixIcon: widget.type != ValidationType.password
          ? Icon(Icons.clear)
          : Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
      controller: _textEditingController,
    );
  }

  hideText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  clearTextField() async {
    await Future.delayed(Duration(milliseconds: 100));
    _textEditingController.clear();
  }
}
