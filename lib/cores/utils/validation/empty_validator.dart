import 'error_msg_constant.dart';
import 'i_validation.dart';

class EmptyValidator implements IValidator {
  final bool allowEmpty;

  EmptyValidator({this.allowEmpty: false});

  @override
  String validate(String data) {
    if (!allowEmpty && data.isEmpty) {
      return ErrorMsgConstant.error_empty;
    }
    return null;
  }
}
