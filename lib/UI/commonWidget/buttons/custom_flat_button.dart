import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomFlatButton({@required this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: FlatButton(
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(
                decoration: TextDecoration.underline,
//                color: Colors.white,
                fontSize: 16.0,
                fontFamily: "WorkSansMedium"),
          )),
    );
  }
}
