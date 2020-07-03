import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/icon/app_icon.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/UI/screens/login/core/verify_phone_no.dart';
import 'package:thikana_ki/UI/screens/login/model/user_model.dart';
import 'package:thikana_ki/cores/configs/constants/app_text.dart';
import 'package:thikana_ki/cores/configs/router/go_next_page.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';
import 'widgets/aggre_check_box.dart';
import '../../commonWidget/text_field/phone_text_form_field.dart';
import 'package:thikana_ki/cores/utils/validation/confirm_password_validation.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final _focusName = FocusNode();
  final _focusPhone = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confPassController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();

  @override
  void dispose() {
    _focusName.dispose();
    _focusPhone.dispose();
    _focusPassword.dispose();
    _focusConfirmPassword.dispose();

    _passController.dispose();
    _confPassController.dispose();
    super.dispose();
  }

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
              child: Form(
                key: _formKey,
                onChanged: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                  setState(() {
                    _formKey.currentState.validate();
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextFormField(
                      hintText: Translate.of(context).translate(input_name),
                      icon: AppIcon(icon: Icons.perm_identity),
                      onSaved: (name) => _user.name = name,
                      currentFocus: _focusName,
                      nextFocus: _focusPhone,
                    ),
                    PhoneTextFormField(
                      onSaved: (phone) => _user.phone = phone.completeNumber,
                      focusNode: _focusPhone,
                      nextFocus: _focusPassword,
                    ),
                    PasswordTextFormField(
                      onSaved: (pass) => _user.password = pass,
                      currentFocus: _focusPassword,
                      nextFocus: _focusConfirmPassword,
                      controller: _passController,
                    ),
                    PasswordTextFormField(
                      hintText: Translate.of(context)
                          .translate(confirm_your_password),
                      currentFocus: _focusConfirmPassword,
                      iValidator: ConfirmPasswordValidator(
                          password: _passController.text),
                      textInputAction: TextInputAction.done,
                    ),
                    AgreeCheckbox(),
                    AppButton(
                      text: Translate.of(context).translate(sign_up),
                      onPressed: () => _signUpUser(_user),
                      disableTouchWhenLoading: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _signUpUser(UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('valid form input has been saved');
      print(
          'Name: ${user.name} \nPhone: ${user.phone}, Password: ${user.password}');
      firebasePhoneAuth.verifyPhone(context, user.phone);
      // popAndOpenRoutePage(
      //     context: context, route: otpInputPageRoute, arguments: user.phone);
    } else {
      print('Invalid form input');
    }
  }
}
