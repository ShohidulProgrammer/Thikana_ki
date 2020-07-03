import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/go_next_page.dart';

class AppCommandButton extends StatelessWidget {
  final String title;
  final String btnText;
  final String route;
  final Color btnTextColor;

  const AppCommandButton(
      {this.title: '',
      this.btnText: '',
      this.btnTextColor: Colors.red,
      this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        FlatButton(
          child: Text(
            btnText,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: btnTextColor,
                fontSize: 16.0),
          ),
          onPressed: () => popAndOpenRoutePage(context: context, route: route),
        ),
      ],
    );
  }
}
