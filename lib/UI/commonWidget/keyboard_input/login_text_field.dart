import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/custom_text_input_field.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

class LoginTextField extends StatefulWidget {
  final String hintText;
  final ValidationType type;
  final Icon icon;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputType keyboardType;

  const LoginTextField(
      {this.hintText,
      this.type,
      this.icon,
      this.keyboardType,
      this.focusNode,
      this.nextFocusNode});

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _textEditingController = TextEditingController();
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  String errorText;

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
        textInputAction: TextInputAction.next,
        onSubmitted: (text) {
          InputFocusChanger.fieldFocusChange(
              context, widget.focusNode ?? _focusNode, widget.nextFocusNode);
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
        controller: _textEditingController,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
