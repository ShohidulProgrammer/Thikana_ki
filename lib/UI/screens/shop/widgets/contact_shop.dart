import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/GoogleMap.dart';

class ContactShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(2.0),
      children: <Widget>[
        Container(
            child: Stack(
          children: <Widget>[
            MyGoogleMap(
              height: 120,
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              height: 40,
              width: 40,
              child: InkWell(
                child: Card(
                  child: Icon(
                    Icons.directions,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ),
          ],
        )),
        SizedBox(height: 5.0,),
        Container(
            child: Stack(
              children: <Widget>[
                MyGoogleMap(
                  height: 120,
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  height: 40,
                  width: 40,
                  child: InkWell(
                    child: Card(
                      child: Icon(
                        Icons.directions,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ),
              ],
            )),


      ],
    );
  }
}
