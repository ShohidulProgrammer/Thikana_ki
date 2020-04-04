import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/emergency_menu_items.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/utils/navigation/tap_service.dart';

import 'home_emergency_category_item.dart';

class EmergencyCategoryIcons extends StatelessWidget {
//  final HomePageModel homePageModel;
//
//  const EmergencyCategoryIcons({this.homePageModel});

  @override
  Widget build(BuildContext context) {
    if (allEmergencyMenuItems == null) {
      print('Emergency item was null');
      return Wrap(
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: List.generate(4, (index) => index).map(
          (item) {
            return HomeEmergencyCategoryItem();
          },
        ).toList(),
      );
    }

    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.center,
//      children: homePageModel.category.map(
      children: allEmergencyMenuItems.map(
        (item) {
          print(
              'My Item: Icon: ${item.emergencyImageName} \nColor: ${item.color} \nTitle: ${item.title}');
          return HomeEmergencyCategoryItem(
            item: item,
            onPressed: (item) {
              Navigator.pushNamed(context, emergencyCategoryListFactoryPageRoute);
//              onTapService(item, context);
            },
          );
        },
      ).toList(),
    );
  }
}
