import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../../../cores/configs/router/router_path_constants.dart';
import 'animated_logo.dart';
import 'app_bangla_logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> getCurrentLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('\n\nMy Location: $position');
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 1),
      () {
        getCurrentLocation();
        Navigator.pushReplacementNamed(context, mainNavigationRoute);
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
