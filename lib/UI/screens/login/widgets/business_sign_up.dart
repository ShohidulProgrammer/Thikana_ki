import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/login_text_field.dart';
import 'package:thikana_ki/UI/screens/login/widgets/password_text_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import 'aggre_check_box.dart';
import 'have_account.dart';

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
    return Stack(
      alignment: Alignment.topCenter,
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
//          height: UIScreenSize.height / 1.4,
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
          child: Card(
            elevation: 2.0,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  MyTextFormField(
                    hintText: 'name',
                    icon: const Icon(
                      Icons.perm_identity,
                      size: 22.0,
                      color: Colors.black,
                    ),
                    fieldKey: _userNameFieldKey,
                  ),
                  MyTextFormField(
                    hintText: 'business_name',
                    icon: Icon(
//              FontAwesomeIcons.coins,
                      Icons.shop,
                      size: 22.0,
                      color: Colors.black,
                    ),
                    fieldKey: _businessNameFieldKey,
                  ),
                  MyTextFormField(
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

//  // sign up button
//  Widget _buildButton() {
//    return AppButton(
//      text: 'Sign Up',
//      onPressed: () {},
//      disableTouchWhenLoading: true,
//    );
//  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      print("email: $_email, password: $_password");
    }
  }
}
