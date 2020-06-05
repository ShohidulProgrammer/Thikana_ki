import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/emergency_menu_items.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

import 'home_emergency_category_item.dart';

class EmergencyCategoryIcons extends StatelessWidget {
//  final HomePageModel homePageModel;
//
//  const EmergencyCategoryIcons({this.homePageModel});

  @override
  Widget build(BuildContext context) {
    if (allEmergencyMenuItems == null) {
      print('Emergency item was null');
      return Row(
//        runSpacing: 10,
//        alignment: WrapAlignment.spaceEvenly,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) => index).map(
          (item) {
            return HomeEmergencyCategoryItem();
          },
        ).toList(),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(3.5),
      child: Row(
//        runSpacing: 10,
//        alignment: WrapAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: allEmergencyMenuItems.map(
          (item) {
//          print(
//              'My Item: Icon: ${item.emergencyImageName} \nColor: ${item.color} \nTitle: ${item.title}');
            return HomeEmergencyCategoryItem(
              item: item,
              onPressed: (item) {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(emergencyCategoryListFactoryPageRoute);
//              onTapService(item, context);
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
