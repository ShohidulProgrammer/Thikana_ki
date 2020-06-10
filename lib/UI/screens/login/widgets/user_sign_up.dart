import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/login_text_field.dart';
import 'package:thikana_ki/UI/screens/login/widgets/password_text_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import 'aggre_check_box.dart';
import 'have_account.dart';

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

//  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: UIScreenSize.height / 1.6,
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MyTextFormField(
                    hintText: 'name',
                    icon: const Icon(
                      Icons.perm_identity,
                      color: Colors.black,
                    ),
                    fieldKey: _userNameFieldKey,
                  ),
                  MyTextFormField(
                      hintText: 'phone',
                      icon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      keyboardType: TextInputType.phone,
                      fieldKey: _phoneFieldKey),
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
                ],
              ),
            ),
          ),
        ),
      ],
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
