import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';


class MyTimePicker extends StatefulWidget {
  @override
  _MyTimePickerState createState() => _MyTimePickerState();
}

class _MyTimePickerState extends State<MyTimePicker> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
//      height: 40,
      child: new TimePickerSpinner(
        is24HourMode: false,
        normalTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.deepOrange
        ),
        highlightedTextStyle: TextStyle(
            fontSize: 22,
            color: Colors.yellow
        ),
        spacing: 1,
        itemHeight: 40,
        onTimeChange: (time) {
          setState(() {
            _dateTime = time;
          });
        },
      ),
    );
  }
}


Widget hourMinute12H(){

}