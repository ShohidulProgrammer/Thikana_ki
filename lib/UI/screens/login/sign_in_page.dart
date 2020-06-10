import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/login_text_field.dart';
import 'package:thikana_ki/UI/screens/login/widgets/password_text_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

import 'widgets/have_account.dart';
import 'widgets/app_logo.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phone, _password;
  final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                padding: const EdgeInsets.symmetric(horizontal: 18.0,),
                child: Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,  vertical: 20.0),
                    child: Column(
//                        mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        MyTextFormField(
                            hintText: 'phone',
                            icon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            keyboardType: TextInputType.phone,
                            fieldKey: _phoneFieldKey),
                        PasswordTextField(),
                        AppButton(
                          text: 'SignIn',
                          onPressed: () {},
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

            ],
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
