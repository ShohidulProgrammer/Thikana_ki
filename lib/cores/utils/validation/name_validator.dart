import 'error_msg_constant.dart';
import 'i_validation.dart';
import 'regexp_pattern.dart';

class NameValidator implements IValidator {
  @override
  String validate(String name) {
    if (!RegexpConstant.usernamePattern.hasMatch(name)) {
      return ErrorMsgConstant.error_name;
    }
    return null;
  }
}
