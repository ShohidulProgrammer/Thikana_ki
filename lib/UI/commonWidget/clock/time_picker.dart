import 'package:flutter/material.dart';

class TimePickerUtils {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  TimeOfDay picked;

  Future<String> selectTime(BuildContext context) async {
    picked = await showTimePicker(context: context, initialTime: _timeOfDay);

    print('Current Time: $picked ');
    return '$picked';
  }
}
