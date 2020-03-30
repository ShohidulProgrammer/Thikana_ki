import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/custom_text_input_field.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

class PasswordTextField extends StatefulWidget {
  final String hintText;
  final int maxLength;
  final int minLength;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const PasswordTextField(
      {Key key,
      this.hintText: 'password',
      this.focusNode,
      this.nextFocusNode,
      this.maxLength,
      this.minLength})
      : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  String errorText;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextInputField(
        key: _fieldKey,
        hintText: Translate.of(context).translate(widget.hintText),
        errorText: errorText != null
            ? Translate.of(context).translate(errorText)
            : null,
        focusNode: widget.focusNode ?? _focusNode,
        obscureText: _obscureText,
        textInputAction: TextInputAction.next,
//        onSubmitted: (text) {
//          if (validate(text)) {}
//          InputFocusChanger.fieldFocusChange(context, widget.focusNode ?? _focusNode, widget.nextFocusNode);
//        },
        onChanged: (text) {
          validate(text);
        },

        icon: Icon(Icons.lock_outline),
        suffixIcon:
            Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        onTapSuffixIcon: hideText(),
        controller: _textEditingController,
      ),
    );
  }

  hideText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool validate(String text) {
    setState(() {
      errorText = UtilValidator.validate(
        data: _textEditingController.text,
        min: widget.minLength ?? 6,
        max: widget.maxLength ?? 16,
      );
      print('Eror text: $errorText');
    });
    return errorText == null ? true : false;
  }
}
