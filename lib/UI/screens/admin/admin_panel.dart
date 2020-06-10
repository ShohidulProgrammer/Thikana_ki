import 'dart:math';

import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/cards/image_with_title_card.dart';
import 'package:thikana_ki/cores/models/screen_models/icon_with_title_list.dart';

import 'widget_list/menu_list.dart';
import 'widgets/menu_card.dart';

class AdminPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Todo: Add grid view
    // Todo: add 3 types of category (category,shop,discount) slider list with add button

    return Scaffold(
        body: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0), //
            // bottom: screenSize.height  /10
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: (3 / 2.5),
            ),
            itemCount: dashBoardMenuList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                color: Colors.blue[50],
                child: MenuCard(
                  context: context,
                  menuModel: dashBoardMenuList[index],
                ),
              );
            }));
  }
}
