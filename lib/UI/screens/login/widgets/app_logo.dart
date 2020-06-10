import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: new Image(
//          width: 250.0,
//          height: UIScreenSize.size.height/4,
          fit: BoxFit.contain,
          image: const AssetImage('assets/images/logo.png')),
    );
  }
}
