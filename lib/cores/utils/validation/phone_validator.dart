import 'package:thikana_ki/cores/utils/validation/i_validation.dart';

import 'error_msg_constant.dart';
import 'regexp_pattern.dart';

class PhoneNumberValidator implements IValidator {
  @override
  String validate(String phoneNumber) {
    return RegexpConstant.phoneNumberPattern.hasMatch(phoneNumber)
        ? null
        : ErrorMsgConstant.phone_number_error;
  }
}
