//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:thikana_ki/cores/utils/import_utility_path.dart';
//
//import 'custom_text_form_field.dart';
//
//class MyTextFormField extends StatefulWidget {
//  final String hintText;
//  final ValidationType type;
//  final Icon icon;
//  final FocusNode focusNode;
//  final FocusNode nextFocusNode;
//  final TextInputType keyboardType;
//  final fieldKey;
//  final Function onSaved;
//  final Function validator;
//  final ValueChanged<String> onFieldSubmitted;
//  final Function onEditingComplete;
//
//  const MyTextFormField(
//      {this.hintText,
//      this.type,
//      this.icon,
//      this.fieldKey,
//      this.keyboardType,
//      this.focusNode,
//      this.nextFocusNode,
//      this.onSaved,
//      this.validator,
//      this.onFieldSubmitted,
//      this.onEditingComplete});
//
//  @override
//  _MyTextFormFieldState createState() => _MyTextFormFieldState();
//}
//
//class _MyTextFormFieldState extends State<MyTextFormField> {
//  final FocusNode _focusNode = FocusNode();
//
//  final TextEditingController _textEditingController = TextEditingController();
//
//  String errorText;
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: CustomTextFormField(
////        key: widget.fieldKey,
//        hintText: Translate.of(context).translate(widget.hintText),
//        errorText: errorText != null
//            ? Translate.of(context).translate(errorText)
//            : null,
////        focusNode: widget.focusNode ?? _focusNode,
////        textInputAction: TextInputAction.next,
//        onSaved: widget.onSaved,
//        validator: widget.validator,
//        onEditingComplete: widget.onEditingComplete,
//        onFieldSubmitted: widget.onFieldSubmitted,
//
////            (text) {
////          InputFocusChanger.fieldFocusChange(
////              context, widget.focusNode ?? _focusNode, widget.nextFocusNode);
////        },
//
////        onChanged: (text) {
////          setState(() {
////            errorText = UtilValidator.validate(
////              data: _textEditingController.text,
////              type: widget.type,
////            );
////          });
////        },
//        icon: widget.icon,
////        controller: _textEditingController,
//        keyboardType: widget.keyboardType,
//      ),
//    );
//  }
//}
