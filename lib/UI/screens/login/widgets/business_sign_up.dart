import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/login_text_field.dart';
import 'package:thikana_ki/UI/widgets/button/app_button.dart';
import 'package:thikana_ki/UI/widgets/login/password_text_field.dart';

class BusinessSignUp extends StatefulWidget {
  @override
  _BusinessSignUpState createState() => _BusinessSignUpState();
}

class _BusinessSignUpState extends State<BusinessSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;
  final _userNameFieldKey = GlobalKey<FormFieldState<String>>();
  final _businessNameFieldKey = GlobalKey<FormFieldState<String>>();
  final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _confirmPasswordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          MyFormTextField(
            hintText: 'name',
            icon: const Icon(
              Icons.perm_identity,
              size: 22.0,
              color: Colors.black,
            ),
            fieldKey: _userNameFieldKey,
          ),
          MyFormTextField(
            hintText: 'business_name',
            icon: Icon(
//              FontAwesomeIcons.coins,
              Icons.shop,
              size: 22.0,
              color: Colors.black,
            ),
            fieldKey: _businessNameFieldKey,
          ),
          MyFormTextField(
              hintText: 'phone',
              icon: Icon(
//                FontAwesomeIcons.mobileAlt,
                Icons.phone,
                size: 22.0,
                color: Colors.black,
              ),
              keyboardType: TextInputType.phone,
              fieldKey: _phoneFieldKey),
          PasswordTextField(),
          PasswordTextField(
            hintText: 'confirm_password',
          ),
          _buildButton(),
        ],
      ),
    );
  }

  // sign up button
  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppButton(
        text: 'Sign Up',
        onPressed: () {},
        disableTouchWhenLoading: true,
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print("email: $_email, password: $_password");
    }
  }
}
