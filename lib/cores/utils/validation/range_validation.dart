import 'package:flutter/cupertino.dart';
import 'error_msg_constant.dart';
import 'i_validation.dart';

class RangeValidator implements IValidator {
  final String value;
  final int min, max;

  RangeValidator({@required this.value, this.min: 4, this.max: 16});

  @override
  String validate(String value) {
    ///Length
    final RegExp _minMaxPattern = new RegExp("^\\w{$min,$max}\$");
    if (!_minMaxPattern.hasMatch(value)) {
      print(ErrorMsgConstant.range_error);
      return ErrorMsgConstant.range_error;
    }
    return null;
  }

}
