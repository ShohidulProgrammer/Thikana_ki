import 'package:flutter/cupertino.dart';

openRoutePage({@required BuildContext context, @required String route, Object arguments}) {
  Navigator.pushNamed(context, route, arguments: arguments);
}
