import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'keyboard_input/custom_text_input_field.dart';

class SearchInputField extends StatefulWidget {
  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  final _textAddressController = TextEditingController();
  final _focusAddress = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 8.0),
        child: CustomTextInputField(
          hintText: Translate.of(context).translate('search_location'),
//      errorText: _validAddress != null
//          ? Translate.of(context).translate(_validAddress)
//          : null,
          focusNode: _focusAddress,
          textInputAction: TextInputAction.next,
          onTapIcon: () async {
            await Future.delayed(Duration(milliseconds: 100));
            _textAddressController.clear();
          },
          onSubmitted: (text) {
//        InputFocusChanger.fieldFocusChange(
//          context,
//          _focusAddress,
//          _focusWebsite,
//        );
          },
          onChanged: (text) {
//        setState(() {
//          _validAddress = UtilValidator.validate(
//            data: _textAddressController.text,
//          );
//        });
          },
          backgroundColor: Colors.white,
          borderRadius: 24,
          icon: Icon(Icons.search,),
          controller: _textAddressController,
        ),
      ),
    );
  }
}
