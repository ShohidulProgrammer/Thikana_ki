import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/shop/shop_details.dart';
import 'package:thikana_ki/cores/configs/router/go_next_page.dart';

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

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: false,
        builder: (context) => ShopDetails(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goNextPage(context: context, page: ShopDetails()),
//      onTap: () =>show(context),
//      onTap: () => Navigator.of(context).pushNamed(shopProfilePageRoute),
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
