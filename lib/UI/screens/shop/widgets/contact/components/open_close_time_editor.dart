import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class ShopOpenCloseTimeEditor extends StatefulWidget {
  final String title;

  const ShopOpenCloseTimeEditor({this.title: ''});

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
        widget.title == ''
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 10.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: Colors.blueGrey),
                ),
              ),
        _buildOpenCloseChooser(),
      ],
    );
  }

  Widget _buildOpenCloseChooser() {
    return Table(defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//        columnWidths: {
//          0: FractionColumnWidth(.2),
//          1: FractionColumnWidth(.4),
//          2: FractionColumnWidth(.4),
//        },
        children: [
//          openCloseTitleRow(),

          openCloseRow('Monday'),
          openCloseRow('Tuesday'),
          openCloseRow('Wedday'),
          openCloseRow('Thurday'),
          openCloseRow('Friday'),
          openCloseRow('Satday'),
          openCloseRow('Sunday'),
        ]);
  }

  TableRow openCloseTitleRow() {
    return TableRow(children: [
      Text(
        'Day',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      Text(
        'Open',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
      Text(
        'Close',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    ]);
  }

  TableRow openCloseRow(String day) {
    return TableRow(children: [
//            MyCheckBox(),
      Text(
        day,
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      showTimePicker(Icons.access_time),
      showTimePicker(Icons.watch_later),
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
