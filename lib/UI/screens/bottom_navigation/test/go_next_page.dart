import 'package:flutter/material.dart';

goNextPage({@required BuildContext context, @required Widget page}) =>

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => page));