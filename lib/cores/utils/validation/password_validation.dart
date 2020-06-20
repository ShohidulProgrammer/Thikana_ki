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
    print('PasswordValidator=> Pass: $password ');
    if (!RegexpConstant.passwordEasy.hasMatch(password)) {
      return ErrorMsgConstant.password_error;
    }

    return null;
  }
}
