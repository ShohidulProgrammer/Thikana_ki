import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/validation/i_validation.dart';


String checkValidity({@required IValidator iValidator, @required String value}) {
  return iValidator.validate(value);
}
