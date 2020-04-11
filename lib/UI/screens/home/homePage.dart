import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/google_map.dart';
import 'package:thikana_ki/UI/commonWidget/tab_bar/custom_tab_bar.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_container_tab_headers_and_bodies.dart';
import 'package:thikana_ki/UI/screens/home/widgets/category_icon.dart';
import 'package:thikana_ki/UI/screens/home/widgets/home_page_share_location.dart';

import '../../commonWidget/keyboard_input/search_input_field.dart';
import 'widgets/thana.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            AreaMap(
              heightPart: 3,
            ),
            HomePageShareLocation()
          ],
        ),
        SearchInputField(),
        ThanaName(),
        EmergencyCategoryIcons(),
        CustomContainerTabBar(
          tabHeaders: homePageTabHeader,
          tabBodies: homePageTabBarBodies,
          heightPart: 3,
        )
      ],
    ));
  }
}
