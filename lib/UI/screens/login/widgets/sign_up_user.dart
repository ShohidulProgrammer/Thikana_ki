import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/icon/app_icon.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/login_text_form_field.dart';
import 'package:thikana_ki/UI/screens/login/model/user_model.dart';
import 'file:///F:/Programming%20WorkPlace/programming%20src/mobileBaseWorkplaceSourceCode/FlutterSourceCode/my_project/thikana%20ki%20src/thikana_ki/lib/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';
import 'package:thikana_ki/cores/utils/validation/email_validation.dart';
import 'package:thikana_ki/cores/utils/validation/validate.dart';
import 'package:thikana_ki/cores/utils/validation/validator.dart';
import 'aggre_check_box.dart';
import '../../../commonWidget/text_field/phone_text_form_field.dart';
import 'package:thikana_ki/cores/utils/keyboard_input/input_focus.dart';

class UserSignUp extends StatefulWidget {
  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final _userNameFieldKey = GlobalKey<FormFieldState<String>>();
  final _businessNameFieldKey = GlobalKey<FormFieldState<String>>();
  final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  final _confirmPasswordFieldKey = GlobalKey<FormFieldState<String>>();

  final _focusName = FocusNode();
  final _focusPhone = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();
  final FocusScopeNode _node = FocusScopeNode();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final UserModel _user = UserModel();
  bool _isValid = false;

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
                onChanged: () {
                  final isValid = _formKey.currentState.validate();
//                  if (_isValid != isValid) {
//                    setState(() {
//                      _isValid = isValid;
//                      print('form is verified: $_isValid');
//                    });
//                  }
//                  else {
//                    print('else form is verified: $_isValid');
//                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextFormField(
                      hintText: 'name',
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
                    ),
                    PasswordTextFormField(
                      hintText: 'confirm_password',
                      onSaved: (conPass) => _user.confirmPassword = conPass,
                      currentFocus: _focusConfirmPassword,
                      textInputAction: TextInputAction.done,
                    ),
                    AgreeCheckbox(
                      onSaved: (isChecked) => _user.termsAgreed = isChecked,
                    ),
                    AppButton(
                      text: 'Sign Up',
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
          'Name: ${user.name} \nPhone: ${user.phone}, Password: ${user.password} Confirm Password: ${user.confirmPassword} \nTerms Agreed: ${user.termsAgreed}');
    } else {
      print('Invalid form input');
    }
  }
}
