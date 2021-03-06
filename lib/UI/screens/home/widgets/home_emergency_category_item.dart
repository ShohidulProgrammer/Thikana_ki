import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/emergency_menu_items.dart';

class HomeEmergencyCategoryItem extends StatelessWidget {
  final EmergencyMenuItem item;
  final ValueChanged<EmergencyMenuItem> onPressed;

  HomeEmergencyCategoryItem({
    Key key,
    this.item,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Center(child: CircularProgressIndicator());
//      return Shimmer.fromColors(
//        baseColor: Theme.of(context).hoverColor,
//        highlightColor: Theme.of(context).highlightColor,
//        enabled: true,
//        child: Container(
//          width: MediaQuery.of(context).size.width / 4.5,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                width: 36,
//                height: 36,
//                alignment: Alignment.center,
//                decoration: BoxDecoration(
//                  shape: BoxShape.circle,
//                  color: Colors.white,
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 3),
//                child: Text(
//                  Translate.of(context).translate('loading'),
//                  style: Theme.of(context)
//                      .textTheme
//                      .caption
//                      .copyWith(fontWeight: FontWeight.bold),
//                ),
//              ),
//            ],
//          ),
//        ),
//      );
    }

    return Container(
      width: MediaQuery.of(context).size.width / 4.5,
      child: GestureDetector(
        onTap: () => onPressed(item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/${item.emergencyImageName}',
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                item.title,
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
