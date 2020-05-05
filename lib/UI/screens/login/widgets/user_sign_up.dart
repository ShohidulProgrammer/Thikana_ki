import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/custom_text_form_field.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
      child: Column(
//        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MyFormTextField(
            hintText: 'name',
            icon: const Icon(
              Icons.perm_identity,
              color: Colors.black,
            ),
              fieldKey: _userNameFieldKey,
          ),
          MyFormTextField(
            hintText: 'phone',
            icon: Icon(
              Icons.phone,
              color: Colors.black,
            ),
            keyboardType: TextInputType.phone,
                fieldKey: _phoneFieldKey
          ),
          PasswordTextField(),
          PasswordTextField(
            hintText: 'confirm_password',
          ),
          AgreeCheckbox(),
          AppButton(
            text: 'Sign Up',
            onPressed: () {},
            disableTouchWhenLoading: true,
          ),
          AlreadyHaveAccount(),
        ],
      ),
    );
  }
//
//  // sign up button
//  Widget _buildButton() {
//    return AppButton(
//      text: 'Sign Up',
//      onPressed: () {},
//      disableTouchWhenLoading: true,
//    );
//  }
}
