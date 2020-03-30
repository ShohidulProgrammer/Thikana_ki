import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBanglaLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screen_height = screenSize.height;
    final double screen_width = screenSize.width;
    return Positioned(
      child: new Align(
        alignment: FractionalOffset.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(bottom: 12.0),
          child: Image(
            width: screen_width * 0.8,
            image: AssetImage(
              'assets/images/thikana_ki_bangla_logo.png',
            ),
          ),
        ),
      ),
    );
  }
}
