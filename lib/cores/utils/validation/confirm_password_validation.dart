import 'package:flutter/cupertino.dart';

import 'error_msg_constant.dart';
import 'i_validation.dart';
import 'regexp_pattern.dart';

class ConfirmPasswordValidator implements IValidator {
  String password = 'empty password';

  ConfirmPasswordValidator({@required this.password});

  @override
  String validate(String confirmPassword) {
    print('Confirm pass: $confirmPassword Pass: $password');
    if (!RegexpConstant.passwordEasy.hasMatch(confirmPassword)) {
      return ErrorMsgConstant.password_error;
    }
    if (confirmPassword != password) {
      return ErrorMsgConstant.confirm_password_error;
    }
    return null;
  }
}
