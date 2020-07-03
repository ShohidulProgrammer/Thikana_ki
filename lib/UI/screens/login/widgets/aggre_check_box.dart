import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/check_box/check_box_form_field.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'package:thikana_ki/cores/utils/validation/error_msg_constant.dart';

class AgreeCheckbox extends StatelessWidget {
  final Function onSaved;

  const AgreeCheckbox({Key key, this.onSaved}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorText = ErrorMsgConstant.error_accept_terms;
    return CheckboxFormField(
      context: context,
      title: GestureDetector(
        child: RichText(
          text: TextSpan(
            text: Translate.of(context).translate('I_accept'),
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: Translate.of(context).translate('terms_and_conditions'),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
        ),
        onTap: () => print('terms and conditions'),
      ),
      onSaved: onSaved,
      errorMsg: Translate.of(context).translate(errorText),
    );
  }
}

//import 'package:flutter/material.dart';
//
//class AgreeCheckbox extends StatefulWidget {
//  final FormFieldSetter<bool> onSaved;
//
//  const AgreeCheckbox({Key key, this.onSaved}) : super(key: key);
//
//  @override
//  _AgreeCheckboxState createState() => _AgreeCheckboxState();
//}
//
//class _AgreeCheckboxState extends State<AgreeCheckbox> {
//  bool _termsChecked = false;
//
//  @override
//  Widget build(BuildContext context) {
//    return Wrap(
//      crossAxisAlignment: WrapCrossAlignment.center,
//      alignment: WrapAlignment.center,
//      direction: Axis.horizontal,
//      runSpacing: -30.0,
//      spacing: -10,
//      children: <Widget>[
//
//        Checkbox(
//          value: _termsChecked,
//          onChanged: _setAgreedToTOS,
//        ),
//        Text('I agree to the'),
//        FlatButton(
//          child: Text(
//            'Privacy Policy',
//            style: TextStyle(
//              fontWeight: FontWeight.w600,
//              fontSize: 14.0,
//              color: Colors.red,
//              decoration: TextDecoration.underline,
//            ),
//          ),
//          onPressed: () {},
//        ),
//        Text('And'),
//        FlatButton(
//          child: Text(
//            'Terms & Conditions',
//            style: TextStyle(
//              color: Colors.red,
//              decoration: TextDecoration.underline,
//            ),
//          ),
//          onPressed: () {},
//        ),
//        Text('of Thikana Ki'),
//      ],
//    );
//  }
//
//  bool _submittable() {
//    return _termsChecked;
//  }
//
//  void _submit() => widget.onSaved;
//

////  {
//////    _formKey.currentState.validate();
////
////
////    print('Form submitted');
////  }
//
//
////output from validation will be displayed in state.errorText (above)
//  validator(bool value) {
//    if (!_termsChecked) {
//      return 'You need to accept terms';
//    } else {
//      return null;
//    }
//  }
//
//  toSubmit() {
//    return OutlineButton(
//      highlightedBorderColor: Colors.black,
//      onPressed: _submittable() ? _submit : null,
//      child: const Text('Register'),
//    );
//  }
//
//  void _setAgreedToTOS(bool newValue) {
//    setState(() {
//      _termsChecked = newValue;
//    });
//  }
//}
//
//
