import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

setStatusBarColor({Color color: Colors.transparent}) {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: color,
      //        statusBarIconBrightness: Brightness.dark,
      //        systemNavigationBarIconBrightness: Brightness.dark,
      //        statusBarBrightness: Brightness.dark,
      //        systemNavigationBarColor: Colors.amber,
      //        systemNavigationBarDividerColor: Colors.blue,
    ),
  );
}
