import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/login_text_field.dart';
import 'package:thikana_ki/UI/screens/login/widgets/password_text_field.dart';

import 'aggre_check_box.dart';
import 'already_have_account.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                MyFormTextField(
                  hintText: 'name',
                  icon: const Icon(Icons.perm_identity),
                  fieldKey: _userNameFieldKey,
                ),
                MyFormTextField(
                    hintText: 'phone',
                    icon: Icon(Icons.phone),
                    keyboardType: TextInputType.phone,
                    fieldKey: _phoneFieldKey),
                PasswordTextField(),
                PasswordTextField(
                  hintText: 'confirm_password',
                ),
              ],
            ),
          ),
          AgreeCheckbox(),
          _buildButton(),
          AlreadyHaveAccount(),
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
}
