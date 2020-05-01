//import 'package:flutter/material.dart';
//import 'package:thikana_ki/UI/screens/home/widget_list/home_page_header_action_list.dart';
//import 'package:thikana_ki/UI/screens/home/widget_list/home_page_sliver_app_bar_item.dart';
//import 'package:thikana_ki/UI/screens/home/widget_list/home_page_tab_headers_and_bodies.dart';
//
//import 'custom_sliver_app_bar.dart';
//import 'custom_sliver_tab_bar.dart';
//import 'silver_tab_bar.dart';
//
//class CustomSliverHeader extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
//        CustomSliverAppBar(sliverAppBarList: homePageSliverAppBarHeaderList, headerActionList: homePageHeaderAction,),
//        SliverPersistentHeader(
//          pinned: true,
//          delegate: CustomSliverTabBar(
//            tabBar: customTabBarHeader(tabHeaders: homePageTabHeader),
//          ),
//        ),
//      ],
//    );
//  }
//}
