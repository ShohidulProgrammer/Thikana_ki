import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/screens/login/model/user_model.dart';
import 'file:///F:/Programming%20WorkPlace/programming%20src/mobileBaseWorkplaceSourceCode/FlutterSourceCode/my_project/thikana%20ki%20src/thikana_ki/lib/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

import 'app_logo.dart';
import 'app_command_button.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _focusPhone = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();
  String _phone, _password;
  final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    final UserModel _user = UserModel();
    bool _isValid = false;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppLogo(),
            Stack(
              alignment: Alignment.center,
              overflow: Overflow.visible,
              children: <Widget>[
                Container(
//                    height: UIScreenSize.height / 3,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18.0,
                  ),
                  child: Card(
                    elevation: 2.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
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
//                        mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            PasswordTextFormField(
                              hintText: 'old_password',
                            ),
                            PasswordTextFormField(
                              hintText: 'confirm_password',
                            ),
                            AppButton(
                              text: 'Change',
                              onPressed: () {},
                              disableTouchWhenLoading: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            HaveAccount(
              title: 'Try Again?',
              btnText: 'Sign In',
              route: signInPageRoute,
            ),
          ],
        ),
      ),
    );
  }

  _resetPassword(GlobalKey<FormState> formKey, UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(
          'Phone: ${user.phone}, Password: ${user.password} Confirm Password: ${user.confirmPassword}');
    } else {
      print('Invalid form input');
    }
  }
}
