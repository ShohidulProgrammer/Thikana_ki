import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/UI/screens/login/model/user_model.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/validation/confirm_password_validation.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'widgets/app_command_button.dart';
import 'widgets/app_logo.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confPassController = TextEditingController();

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
            Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20.0),
                  child: Form(
                    key: _formKey,
                    onChanged: () async {
                      await Future.delayed(Duration(milliseconds: 300));
                      setState(() {
                        _formKey.currentState.validate();
                      });
                    },
                    child: Column(
//                        mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        PasswordTextFormField(
                          hintText: Translate.of(context)
                              .translate('input_new_password'),
                          onSaved: (pass) => _user.password = pass,
                          currentFocus: _focusPassword,
                          nextFocus: _focusConfirmPassword,
                          controller: _passController,
                        ),
                        PasswordTextFormField(
                          hintText: Translate.of(context)
                              .translate('confirm_your_password'),
                          currentFocus: _focusConfirmPassword,
                          iValidator: ConfirmPasswordValidator(
                              password: _passController.text),
                          textInputAction: TextInputAction.done,
                        ),
                        AppButton(
                          text: Translate.of(context).translate('confirm'),
                          onPressed: () => _resetPassword(_user),
                          disableTouchWhenLoading: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AppCommandButton(
              title: Translate.of(context).translate('try_again'),
              btnText: Translate.of(context).translate('sign_in'),
              route: signInPageRoute,
            ),
          ],
        ),
      ),
    );
  }

  _resetPassword(UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Password: ${user.password}');
    } else {
      print('Invalid form input');
    }
  }
}
