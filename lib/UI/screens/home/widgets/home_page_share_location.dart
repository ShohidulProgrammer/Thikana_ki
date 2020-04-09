import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/circular_icon.dart';

class HomePageShareLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30.0,
      right: 5.0,
      height: 40,
      width: 40,
      child: CircularIcon(
          icon: Icons.share,
          backgroundColor: Colors.blueGrey[300],
          onTap: () {
            // Todo: Location Share function
          }),
//      child: InkWell(
//        onTap: () {},
//        child: CircleAvatar(
//          maxRadius: 54.0,
//          backgroundColor: Colors.blueGrey[600],
//          child: Icon(
//            Icons.share,
//            color: Colors.white
//          ),
//        ),
//      ),
    );
  }
}
