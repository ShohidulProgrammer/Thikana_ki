import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
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

  @override
  void dispose() {
    _focusPhone.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel();
    // bool _isValid = false;
//    InputFocusChanger.hiddenKeyboard(context);

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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    PhoneTextFormField(
                      onSaved: (phone) => user.phone = phone.completeNumber,
                      focusNode: _focusPhone,
                      nextFocus: _focusPassword,
                    ),
                    PasswordTextFormField(
                      onSaved: (pass) => user.password = pass,
                      currentFocus: _focusPassword,
                    ),
                    AppButton(
                      text: Translate.of(context).translate('sign_in'),
                      onPressed: () => _signIn(user),
                      disableTouchWhenLoading: true,
                    ),
                    AppCommandButton(
                      btnText:
                          Translate.of(context).translate('forgot_password'),
                      btnTextColor: Colors.orange,
                      route: resetPasswordPageRoute,
                    ),
                  ],
                ),
              ),
            ),
          ),
          AppCommandButton(
            btnText: Translate.of(context).translate('create_account'),
            btnTextColor: Colors.green,
            route: signUpPageRoute,
          ),
        ],
      ),
    );
  }

  _signIn(UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Phone: ${user.phone}, Password: ${user.password}');
    } else {
      print('Invalid form input');
    }
  }
}
