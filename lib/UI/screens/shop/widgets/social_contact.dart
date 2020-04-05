import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/list/custom_list_tile.dart';

class SocialContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: CustomListTile(
//          leading: Icon(Icons.people,color: Colors.transparent,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
//              Text('Social : '),
            InkWell(
                child: Image(
                  image: AssetImage(
                    'assets/images/fb.png',
                  ),
                  height: 70.0,
                )),
            InkWell(
                child: Image(
                  image: AssetImage(
                    'assets/images/linkedIn.png',
                  ),
                  height: 45.0,
                )),
            InkWell(
                child: Image(
                  image: AssetImage(
                    'assets/images/twitter.png',
                  ),
                  height: 55.0,
                )),
          ],
        ),
      ),
    );
  }
}
