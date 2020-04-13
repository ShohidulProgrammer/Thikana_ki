import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:thikana_ki/UI/commonWidget/dropdown/my_drop_down_menu.dart';
import 'package:thikana_ki/UI/screens/shop/widget_list/time_value_list.dart';

class ShopOpenCloseTimeEditor extends StatefulWidget {
  @override
  _ShopOpenCloseTimeEditorState createState() =>
      _ShopOpenCloseTimeEditorState();
}

class _ShopOpenCloseTimeEditorState extends State<ShopOpenCloseTimeEditor> {
  String _openHour,
      _openMinute,
      _openPeriods,
      _closeHour,
      _closeMinute,
      _closePeriods;

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
//        _buildOpenCloseChooser(day: 'Sun'),
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
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FractionColumnWidth(.2)
        },
        children: [
          TableRow(children: [
            Text(
              day,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            MyDropDownMenu(
              menuItemList: hours,
            ),
            MyDropDownMenu(
              menuItemList: minutes,
            ),
            MyDropDownMenu(
              menuItemList: amPm,
            ),
            Text('  -'),
            MyDropDownMenu(
              menuItemList: hours,
            ),
            MyDropDownMenu(
              menuItemList: minutes,
            ),
            MyDropDownMenu(
              menuItemList: amPm,
            ),
          ]),
        ]);
  }

  Widget showTimePicker(String day) {
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
        child: Text(
          day,
          style: TextStyle(color: Colors.blue),
        ));
  }

//  void selectedItem(newValue) {
//    setState(() {
//      _selectedItem = newValue;
//      print('Select dropdown item: $_selectedItem');
//    });
//  }
}
