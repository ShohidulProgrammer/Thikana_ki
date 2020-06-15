import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:thikana_ki/UI/commonWidget/icon/app_icon.dart';
import 'package:thikana_ki/cores/utils/keyboard_input/input_focus.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'package:thikana_ki/cores/utils/validation/phone_validator.dart';
import 'package:thikana_ki/cores/utils/validation/validator.dart';
import '../../screens/login/widgets/error_msg.dart';

class PhoneTextFormField extends StatefulWidget {
  final FormFieldSetter<PhoneNumber> onSaved;
  final Function onSubmitted;
  final Color backgroundColor;
  final FocusNode focusNode;
  final FocusNode nextFocus;

  final Icon icon;
  final VoidCallback onIconTap;

  const PhoneTextFormField({
    this.onSaved,
    this.onSubmitted,
    this.backgroundColor,
    this.focusNode,
    this.nextFocus,
    this.icon,
    this.onIconTap,
  });

  @override
  _PhoneTextFormFieldState createState() => _PhoneTextFormFieldState();
}

class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
  String errorText;

  @override
  Widget build(BuildContext context) {
    String errorText;
    final TextEditingController _textEditingController =
        TextEditingController();

    return SizedBox(
      height: 70.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.only(bottom: 2.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? Colors.blueGrey[50],
//            Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: AppIcon(icon: Icons.local_phone),
            ),
            Expanded(
              flex: 5,
              child: IntlPhoneField(
                initialCountryCode: 'BD',
                decoration: InputDecoration(
                  hintText: Translate.of(context).translate('phone'),
                  contentPadding: EdgeInsets.all(10.0),
                  border: InputBorder.none,
                  errorStyle: TextStyle(height: 0.8),
                ),
                onSaved: widget.onSaved,
                autoValidate: false,
                validator: _validator,
                focusNode: widget.focusNode,
                onSubmitted: (_) => InputFocusChanger.fieldFocusChange(
                    context, widget.focusNode, widget.nextFocus),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // phoneNumber validation
  String _validator(phoneNumber) {
    setState(() {
      errorText =
          checkValidity(iValidator: PhoneNumberValidator(), value: phoneNumber);
      print('_validator Error text: $errorText');
    });

    return errorText == null
        ? null
        : Translate.of(context).translate(errorText);
  }

  bool isValid(PhoneNumber phone) {
    setState(() {
      errorText = checkValidity(
          iValidator: PhoneNumberValidator(), value: phone.number);
      print('isValid Error text: $errorText');
    });
    return errorText == null ? true : false;
  }

  Widget _buildErrorLabel(BuildContext context) {
    return ErrorMsg(errorText: errorText);
  }
}
