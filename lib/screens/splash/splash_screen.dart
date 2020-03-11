import 'package:flutter/material.dart';
import '../../configs/router/router_path_constants.dart';
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
      Duration(seconds: 4),
      () {
        Navigator.pushNamed(context, mainNavigationRoute);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.maxFinite,
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
