import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/popular/emergency_categroy_iem_list_factory.dart';

goNextPage({@required BuildContext context, @required Widget page}) =>

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => page));