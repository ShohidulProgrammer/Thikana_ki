import 'package:flutter/material.dart';

class AgreeCheckbox extends StatefulWidget {
  @override
  _AgreeCheckboxState createState() => _AgreeCheckboxState();
}

class _AgreeCheckboxState extends State<AgreeCheckbox> {
  bool _termsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        direction: Axis.horizontal,
        runSpacing: -30.0,
        spacing: -10,
        children: <Widget>[
          Checkbox(
            value: _termsChecked,
            onChanged: _setAgreedToTOS,
          ),
          Text('I agree to the'),
          FlatButton(
            child: Text(
              'Pricvacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {},
          ),
          Text('And'),
          FlatButton(
            child: Text(
              'Terms & Conditions',
              style: TextStyle(
                color: Colors.red,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {},
          ),
          Text('of Thikana Ki'),
        ],
      ),
    );
  }

  bool _submittable() {
    return _termsChecked;
  }

  void _submit() {
//    _formKey.currentState.validate();
    print('Form submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      _termsChecked = newValue;
    });
  }

//output from validation will be displayed in state.errorText (above)
//  validator(bool value) {
//    if (!_termsChecked) {
//      return 'You need to accept terms';
//    } else {
//      return null;
//    }
//  }

//  toSubmit(){
//   return OutlineButton(
//      highlightedBorderColor: Colors.black,
//      onPressed: _submittable() ? _submit : null,
//      child: const Text('Register'),
//    );
//  }
}
