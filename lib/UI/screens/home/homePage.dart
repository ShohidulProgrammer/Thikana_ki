import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/tab_bar/custom_default_tab_bar.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_tab_headers_and_bodies.dart';

import 'widget_list/home_page_sliver_app_bar_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDefaultTabBar(
      headerList: homePageHeader,
      tabBodiesList: homePageTabBarBodies,
    );
  }
}
