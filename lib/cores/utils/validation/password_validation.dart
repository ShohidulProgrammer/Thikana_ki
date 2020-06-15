import 'package:flutter/cupertino.dart';
import 'error_msg_constant.dart';
import 'i_validation.dart';
import 'regexp_pattern.dart';

//enum PasswordType {
//  passwordEasy,
//  passwordNormal,
//  passwordMedium,
//  passwordHard,
//  passwordStrong
//}

class PasswordValidator implements IValidator {
  @override
  String validate(String password) {
    if (!RegexpConstant.passwordEasy.hasMatch(password)) {
      return ErrorMsgConstant.password_error;
    }
    return null;
  }
}
