import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ShopOpenCloseTimeEditor extends StatefulWidget {
  @override
  _ShopOpenCloseTimeEditorState createState() =>
      _ShopOpenCloseTimeEditorState();
}

class _ShopOpenCloseTimeEditorState extends State<ShopOpenCloseTimeEditor> {
  String _monOpen,
      _tuOpen,
      _wedOpen,
      _thurOpen,
      _friOpen,
      _satOpen,
      _sunOpen,
      _monClose,
      _tuClose,
      _wedClose,
      _thurClose,
      _friClose,
      _satClose,
      _sunClose;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildOpenCloseTitle(),
        _buildOpenCloseChooser(day: 'Mon'),
        _buildOpenCloseChooser(day: 'Tu'),
        _buildOpenCloseChooser(day: 'Wed'),
        _buildOpenCloseChooser(day: 'Thur'),
        _buildOpenCloseChooser(day: 'Fri'),
        _buildOpenCloseChooser(day: 'Sat'),
        _buildOpenCloseChooser(day: 'Sun'),
      ],
    );
  }

  Widget _buildOpenCloseTitle() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 26.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Day',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text(
            'Open Time',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          Text('  -'),
          Text(
            'Close Time',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenCloseChooser({
    String day,
  }) {
    return Table(defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//        columnWidths: {
//          0: FractionColumnWidth(.2)
//        },
        children: [
          TableRow(children: [
//            MyCheckBox(),
            Text(
              day,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            showTimePicker(Icons.access_time),
            SizedBox(
              width: 5.0,
            ),
            showTimePicker(Icons.watch_later),

//            MyDropDownMenu(
//              menuItemList: hours,
//            ),
//            MyDropDownMenu(
//              menuItemList: minutes,
//            ),
//            MyDropDownMenu(
//              menuItemList: amPm,
//            ),
//            Text('  -'),
//            MyDropDownMenu(
//              menuItemList: hours,
//            ),
//            MyDropDownMenu(
//              menuItemList: minutes,
//            ),
//            MyDropDownMenu(
//              menuItemList: amPm,
//            ),
          ]),
        ]);
  }

  Widget showTimePicker(IconData icon) {
    return FlatButton(
        onPressed: () {
          DatePicker.showTime12hPicker(context, showTitleActions: true,
              onChanged: (date) {
            print('change $date in time zone ' +
                date.timeZoneOffset.inHours.toString());
          }, onConfirm: (date) {
            print('confirm $date');
          }, currentTime: DateTime.now());
        },
        child: Icon(icon));
  }

//  void selectedItem(newValue) {
//    setState(() {
//      _selectedItem = newValue;
//      print('Select dropdown item: $_selectedItem');
//    });
//  }
}
