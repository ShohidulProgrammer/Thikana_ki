import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

import 'custom_text_form_field.dart';

class MyFormTextField extends StatefulWidget {
  final String hintText;
  final ValidationType type;
  final Icon icon;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputType keyboardType;
  final fieldKey;

  const MyFormTextField(
      {this.hintText,
      this.type,
      this.icon,
      this.fieldKey,
      this.keyboardType,
      this.focusNode,
      this.nextFocusNode});

  @override
  _MyFormTextFieldState createState() => _MyFormTextFieldState();
}

class _MyFormTextFieldState extends State<MyFormTextField> {
  final FocusNode _focusNode = FocusNode();

  final TextEditingController _textEditingController = TextEditingController();

  String errorText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextFormField(
        key: widget.fieldKey,
        hintText: Translate.of(context).translate(widget.hintText),
        errorText: errorText != null
            ? Translate.of(context).translate(errorText)
            : null,
        focusNode: widget.focusNode ?? _focusNode,
        textInputAction: TextInputAction.next,
        onSaved: (text) {
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
