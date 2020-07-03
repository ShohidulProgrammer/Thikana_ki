import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/icon/app_icon.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/custom_text_form_field.dart';
import 'package:thikana_ki/UI/commonWidget/text_field/password_text_form_field.dart';
import 'package:thikana_ki/UI/screens/login/model/user_model.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';
import 'package:thikana_ki/cores/utils/validation/confirm_password_validation.dart';
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

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confPassController = TextEditingController();

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
                onChanged: () async {
                  await Future.delayed(Duration(milliseconds: 300));
                  setState(() {
                    _formKey.currentState.validate();
                  });
                },
                child: Column(
//                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CustomTextFormField(
                      hintText: Translate.of(context).translate('input_name'),
                      icon: const AppIcon(icon: Icons.perm_identity),
                      onSaved: (name) => _user.name = name,
                      currentFocus: _focusName,
                      nextFocus: _focusBusinessName,
                    ),
                    CustomTextFormField(
                      hintText:
                          Translate.of(context).translate('input_business_name'),
                      icon: const AppIcon(icon: Icons.home),
                      onSaved: (bisName) => _user.businessName = bisName,
                      currentFocus: _focusBusinessName,
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
                      hintText:
                          Translate.of(context).translate('confirm_password'),
                      currentFocus: _focusConfirmPassword,
                      iValidator: ConfirmPasswordValidator(
                          password: _passController.text),
                      textInputAction: TextInputAction.done,
                    ),
                    AgreeCheckbox(),
                    AppButton(
                      text: Translate.of(context).translate('sign_up'),
                      onPressed: () => _signUpBusiness(_user),
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

  _signUpBusiness(UserModel user) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('valid form input has been saved');
      print(
          'Name: ${user.name},  Business: ${user.businessName}, Phone: ${user.phone}, Password: ${user.password} ');
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
