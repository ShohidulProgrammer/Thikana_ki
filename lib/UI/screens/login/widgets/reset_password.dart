import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/screens/login/widgets/password_text_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

import 'app_logo.dart';
import 'have_account.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phone, _password;
  final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
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
                      child: Column(
//                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          PasswordTextField(
                            hintText: 'old_password',
                          ),
                          PasswordTextField(
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
}
