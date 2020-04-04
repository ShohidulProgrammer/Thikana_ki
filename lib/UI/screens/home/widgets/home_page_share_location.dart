import 'package:flutter/material.dart';

class HomePageShareLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.0,
      right: 5.0,
      height: 40,
      width: 40,
      child: InkWell(
        onTap: () {},
        child: Card(
          elevation: 5,

          child: Icon(
            Icons.share,
            color: Colors.deepOrange,
          ),
//          IconButton(
//
//            icon:
//            tooltip: 'Share your location',
//
//          ),
        ),
      ),
    );
  }
}
