import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'file:///F:/Programming%20WorkPlace/programming%20src/mobileBaseWorkplaceSourceCode/FlutterSourceCode/my_project/thikana%20ki%20src/thikana_ki/lib/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

import 'model/user_model.dart';
import 'widgets/app_command_button.dart';
import 'widgets/app_logo.dart';
import '../../commonWidget/text_field/phone_text_form_field.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _focusPhone = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();

  final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel();
    bool _isValid = false;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppLogo(),
          Card(
            margin: EdgeInsets.all(15.0),
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
              child: Form(
                key: _formKey,
                onChanged: () {
                  final isValid = _formKey.currentState.validate();
                  if (_isValid != isValid) {
                    setState(() {
                      _isValid = isValid;
                      print('form is verified: $_isValid');
                    });
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    PhoneTextFormField(
                        onSaved: (phone) => user.phone = phone.completeNumber),
                    PasswordTextFormField(
                      onSaved: (pass) => user.password = pass,
                    ),
                    AppButton(
                      text: 'SignIn',
                      onPressed: () => _signIn(_formKey, user),
                      disableTouchWhenLoading: true,
                    ),
                    HaveAccount(
                      title: 'Forgot Password?',
                      btnText: 'Reset Password',
                      route: resetPasswordPageRoute,
                    ),
                  ],
                ),
              ),
            ),
          ),
          HaveAccount(
            title: 'Create a new account',
            btnText: 'Sign Up',
            route: signUpPageRoute,
          ),
        ],
      ),
    );
  }

  _signIn(GlobalKey<FormState> formKey, UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(
          'Phone: ${user.phone}, Password: ${user.password} Confirm Password: ${user.confirmPassword}');
    } else {
      print('Invalid form input');
    }
  }
}
