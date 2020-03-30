import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/phon_text_field.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/user_name_text_field.dart';
import 'package:thikana_ki/UI/widgets/button/app_button.dart';
import 'package:thikana_ki/UI/widgets/login/password_text_field.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildLogo(),
            UserNameTextField(),
            PhoneTextField(),
            PasswordTextField(),
            PasswordTextField(
              hintText: 'confirm_password',
            ),
            _buildButton(),
          ],
        ),
      ),
    );
  }

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

// logo
Widget buildLogo() {
  return Padding(
    padding: EdgeInsets.only(top: 75.0, bottom: 25.0),
    child: new Image(
//        width: 250.0,
//        height: 191.0,
        fit: BoxFit.contain,
        image: new AssetImage('assets/images/thikana_ki_bangla_logo.png')),
  );
}
