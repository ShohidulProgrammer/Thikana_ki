import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/utils/language/translate.dart';

class ContactInfoShopOpenTime extends StatefulWidget {
  final String hour;

  final List<Map<String, dynamic>> hourDetail;

  const ContactInfoShopOpenTime({@required this.hour, @required this.hourDetail});

  @override
  _ContactInfoShopOpenTimeState createState() =>
      _ContactInfoShopOpenTimeState();
}

class _ContactInfoShopOpenTimeState extends State<ContactInfoShopOpenTime> {
  bool _showHour = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: InkWell(
            onTap: () {
              setState(() {
                _showHour = !_showHour;
              });
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).dividerColor,
                        ),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).translate('open_time'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              widget.hour,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _showHour ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                )
              ],
            ),
          ),
        ),
        Visibility(
          visible: _showHour,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.hourDetail.map((item) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                      width: 1,
                    ),
                  ),
                ),
                margin: EdgeInsets.only(
                  left: 42,
                ),
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      Translate.of(context).translate(item['title']),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text(
                      item['time'] == 'day_off'
                          ? Translate.of(context).translate('day_off')
                          : item['time'],
                      style: Theme.of(context).textTheme.caption.copyWith(
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
