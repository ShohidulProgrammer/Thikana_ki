import 'package:flutter/material.dart';

goNextPage({@required BuildContext context, @required Widget page}) =>
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));

openRoutePage(
    {@required BuildContext context,
    @required String route,
    Object arguments}) {
  Navigator.pushNamed(context, route, arguments: arguments);
}

popAndOpenRoutePage(
    {@required BuildContext context,
    @required String route,
    Object arguments}) {
  Navigator.popAndPushNamed(context, route, arguments: arguments);
}
