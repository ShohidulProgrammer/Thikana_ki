import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/custom_text_input_field.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/login_text_field.dart';
import 'package:thikana_ki/cores/utils/import_utility_path.dart';

class NameTextField extends StatefulWidget {
  final String hintText;
  final ValidationType type;
  final Icon icon;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const NameTextField(
      {Key key,
      this.hintText,
      this.type,
      this.icon,
      this.focusNode,
      this.nextFocusNode})
      : super(key: key);

  @override
  _NameTextFieldState createState() => _NameTextFieldState();
}

class _NameTextFieldState extends State<NameTextField> {
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
        focusNode: _focusNode,
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
        icon: Icon(Icons.perm_identity),
        controller: _textEditingController,
      ),
    );
  }
}

class UserNameTextField extends LoginTextField {
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  UserNameTextField({
    this.focusNode,
    this.nextFocusNode,
  }) : super(
          hintText: 'name',
          icon: Icon(Icons.perm_identity),
          focusNode: focusNode,
          nextFocusNode: nextFocusNode,
        );
}
