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
            _buildImageIcon(image: 'fb.png', height: 70.0),
            _buildImageIcon(image: 'linkedIn.png', height: 45.0),
            _buildImageIcon(image: 'twitter.png', height: 55.0),
          ],
        ),
      ),
    );
  }

  Widget _buildImageIcon({String image, double height}) {
    return InkWell(
        child: Image(
      image: AssetImage(
        'assets/images/$image',
      ),
      height: height,
    ));
  }
}
