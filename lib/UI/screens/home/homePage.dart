import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/sliver_page.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_container_tab_headers_and_bodies.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_header_action_list.dart';

import 'widget_list/home_page_sliver_app_bar_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyGenericSliverPage(
        sliverHeadersList: homePageSliverHeaderList,
        headerActionList: homePageHeaderAction,
        tabBarHeaderList: homePageTabHeader,
        tabBodiesList: homePageTabBarBodies);

//    return SingleChildScrollView(
//        child: Column(
//          children: <Widget>[
//            Stack(
//              children: <Widget>[
//                MyGoogleMap(
//                  heightPart: 3,
//                ),
//                HomePageShareLocation()
//              ],
//            ),
//            SearchInputField(),
//            ThanaName(),
//            EmergencyCategoryIcons(),
//            CustomContainerTabBar(
//              tabHeaders: homePageTabHeader,
//              tabBodies: homePageTabBarBodies,
//              heightPart: 3,
//            )
//          ],
//        ));
  }
}
