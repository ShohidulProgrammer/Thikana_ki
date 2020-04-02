import 'package:flutter/material.dart';

class AlreadyHaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Already have an account?'),
        FlatButton(
          child: Text(
            'Sign In',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.red, fontSize: 16.0),
          ), onPressed: () {},
        ),
      ],
    );
  }
}
