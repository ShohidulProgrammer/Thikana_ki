import 'package:flutter/material.dart';
import '../../../cores/configs/router/router_path_constants.dart';
import '../../../cores/models/model_location.dart';

class EmergencyCategoryListTileIem extends StatelessWidget {
  final String title;
  final String subTitle;
  final LocationModel locationModel;
  final String mobileNo;
  final IconData icon;
  final Color iconColor;

  const EmergencyCategoryListTileIem(
      {this.title = '',
      this.subTitle = '',
      this.locationModel,
      this.mobileNo = '',
      this.icon,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(shopDetailPageRoute),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subTitle),
        trailing: Row(
//          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: new Icon(Icons.location_on),
              highlightColor: Colors.pink,
              onPressed: () {
                print("Location icon pressed");
              },
            ),
            IconButton(
              icon: new Icon(Icons.phone),
              highlightColor: Colors.pink,
              onPressed: () {
                print("Call icon pressed");
              },
            ),
          ],
        ),
      ),
    );
  }
}
