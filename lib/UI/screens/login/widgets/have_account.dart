import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/open_route_page.dart';

class HaveAccount extends StatelessWidget {
  final String title;
  final String btnText;
  final String route;

  const HaveAccount({Key key, this.title, this.btnText, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title ?? ''),
        FlatButton(
          child: Text(
            btnText ?? '',
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Colors.red, fontSize: 16.0),
          ),
          onPressed: () => openRoutePage(context: context, route: route),
        ),
      ],
    );
  }
}
