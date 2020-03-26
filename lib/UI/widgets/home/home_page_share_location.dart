import 'package:flutter/material.dart';

class HomePageShareLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 10.0,
      right: 10.0,
      child: IconButton(
        color: Colors.red,
        icon: Icon(Icons.share),
        tooltip: 'Share your location',
        onPressed: () {},
      ),
    );
  }
}
