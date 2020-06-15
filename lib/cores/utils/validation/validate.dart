import 'package:thikana_ki/cores/utils/validation/error_msg_constant.dart';

enum ValidationType {
  normal,
  email,
  password,
  phone,
}

class UtilValidator {
  static validate({
    String data,
    ValidationType type: ValidationType.normal,
    int min,
    int max,
    bool allowEmpty = false,
  }) {
    switch (type) {
      case ValidationType.password:

        ///Length
        if (min != null ||
            max != null && (data.length < min || data.length > max)) {
          return ErrorMsgConstant.range_error;
          //  return '$error_range : ($min-$max)';
        }
        return null;

      default:
        if (!allowEmpty && data.isEmpty) {
          return ErrorMsgConstant.error_empty;
        }
        return null;
    }
  }

  ///Singleton factory
  static final UtilValidator _instance = UtilValidator._internal();

  factory UtilValidator() {
    return _instance;
  }

  UtilValidator._internal();
}
