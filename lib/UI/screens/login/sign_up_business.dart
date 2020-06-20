import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/icon/app_icon.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/UI/screens/login/model/user_model.dart';
import 'widgets/aggre_check_box.dart';
import '../../commonWidget/text_field/phone_text_form_field.dart';

class BusinessSignUp extends StatefulWidget {
  @override
  _BusinessSignUpState createState() => _BusinessSignUpState();
}

class _BusinessSignUpState extends State<BusinessSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _user = UserModel();
  // bool _isValid = false;

  final _focusName = FocusNode();
  final _focusBusinessName = FocusNode();
  final _focusPhone = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();
  // final FocusScopeNode _node = FocusScopeNode();

  // final _userNameFieldKey = GlobalKey<FormFieldState<String>>();
  // final _businessNameFieldKey = GlobalKey<FormFieldState<String>>();
  // final _phoneFieldKey = GlobalKey<FormFieldState<String>>();
  // final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  // final _confirmPasswordFieldKey = GlobalKey<FormFieldState<String>>();

  @override
  void dispose() {
    _focusName.dispose();
    _focusBusinessName.dispose();
    _focusPhone.dispose();
    _focusPassword.dispose();
    _focusConfirmPassword.dispose();
    super.dispose();
  }

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
              child: Form(
                key: _formKey,
                onChanged: () {
                   _formKey.currentState.validate();
//                  if (_isValid != isValid) {
////                    setState(() {
////                      _isValid = isValid;
////                      print('form is verified: $_isValid');
////                    });
////                  }
                },
                child: Column(
//                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextFormField(
                      hintText: 'name',
                      icon: const AppIcon(icon: Icons.perm_identity),
                      onSaved: (name) => _user.name = name,
                      currentFocus: _focusName,
                      nextFocus: _focusBusinessName,
                    ),
                    CustomTextFormField(
                      hintText: 'business_name',
                      onSaved: (bisName) => _user.businessName = bisName,
                      currentFocus: _focusBusinessName,
                      nextFocus: _focusPhone,
                      icon: const AppIcon(icon: Icons.home),
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
                      onPressed: () => _signUpBusiness(_formKey, _user),
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

  _signUpBusiness(GlobalKey<FormState> formKey, UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('valid form input has been saved');
      print(
          'Name: ${user.name},  Business: ${user.businessName}, Phone: ${user.phone}, Password: ${user.password} Confirm Password: ${user.confirmPassword}');
    } else {
      print('Invalid form input');
    }
  }

//  void signIn() async {
//    if (_formKey.currentState.validate()) {
//      _formKey.currentState.save();
//
//      print("Name: ${user.name},  password: ${user.password}");
//    }
//  }
}
