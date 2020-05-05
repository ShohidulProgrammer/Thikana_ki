import 'package:flutter/material.dart';

import '../../../cores/configs/router/router_path_constants.dart';
import 'animated_logo.dart';
import 'app_bangla_logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.pushReplacementNamed(context, mainNavigationRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
//        height: double.maxFinite,
        child: new Stack(
          //alignment:new Alignment(x, y)
          children: <Widget>[
            AnimatedLogo(),
            AppBanglaLogo(),
          ],
        ),
      ),
    );
  }
}
