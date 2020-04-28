import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/google_map.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/search_input_field.dart';
import 'package:thikana_ki/UI/commonWidget/painter/border_line.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/custom_sliver_app_bar.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/custom_sliver_tab_bar.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/silver_tab_bar.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_header_action_list.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_tab_headers_and_bodies.dart';
import 'package:thikana_ki/UI/screens/home/widgets/category_icon.dart';
import 'package:thikana_ki/UI/screens/home/widgets/thana.dart';

List<Widget> homePageSliverAppBarHeaderList = [
  MyGoogleMap(heightPart: 3),
  SearchInputField(),
  ThanaName(),
  EmergencyCategoryIcons(),
  BorderLine(),
//  CustomTabBarHeader(tabHeaders: homePageTabHeader),
];


List<Widget> homePageHeader = [
  CustomSliverAppBar(sliverHeadersList: homePageSliverAppBarHeaderList, headerActionList: homePageHeaderAction,),
  SliverPersistentHeader(
    pinned: true,
    delegate: CustomSliverTabBar(
      tabBar: customTabBarHeader(tabHeaders: homePageTabHeader),
    ),
  ),
];
