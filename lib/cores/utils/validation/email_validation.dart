import 'error_msg_constant.dart';
import 'i_validation.dart';
import 'regexp_pattern.dart';

class EmailValidator implements IValidator {
  @override
  String validate(String email) {
    if (!RegexpConstant.emailPattern.hasMatch(email)) {
      return ErrorMsgConstant.error_email;
    }
    return null;
  }
}
