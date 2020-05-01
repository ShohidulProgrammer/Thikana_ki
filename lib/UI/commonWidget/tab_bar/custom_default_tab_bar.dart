import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/custom_sliver_app_bar.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/custom_sliver_tab_bar.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/silver_tab_bar.dart';

//class CustomDefaultTabBar extends StatelessWidget {
//  final List<Widget> appBarHeaders;
//  final List<Widget> headerActions;
//  final List<Widget> tabHeaders;
//  final List<Widget> tabBodies;
//
//  const CustomDefaultTabBar({this.appBarHeaders,this.headerActions, this.tabHeaders, this.tabBodies});
//
//  @override
//  Widget build(BuildContext context) {
//    // change status bar color
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
//    return DefaultTabController(
//      length: tabHeaders.length ?? 0,
//      child: NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//          return <Widget>[
//            CustomSliverAppBar(
//              sliverAppBarList: appBarHeaders,
//              headerActionList: headerActions,
//            ),
//            SliverPersistentHeader(
//              pinned: true,
//              delegate: CustomSliverTabBar(
//                tabBar: customTabBarHeader(tabHeaders: tabHeaders),
//              ),
//            ),
//          ];
////          return headerList.map((headerItem) => headerItem).toList();
//        },
//        body: TabBarView(
//            children: tabBodies.map<Widget>((tabs) => tabs).toList()),
//      ),
//    );
//  }
//}

class CustomDefaultTabBar extends StatelessWidget {
  final List<Widget> appBarHeaders;
  final List<Widget> headerActions;
  final List<Widget> tabHeaders;
  final List<Widget> tabBodies;
  final ScrollPhysics scrollPhysics;

  const CustomDefaultTabBar(
      {this.appBarHeaders,
      this.headerActions,
      this.tabHeaders,
      this.tabBodies,
      this.scrollPhysics
      });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return DefaultTabController(
      length: tabHeaders.length ?? 0,
//      length: tabBodiesList.length ?? 0,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomSliverAppBar(
              sliverAppBarList: appBarHeaders,
              headerActionList: headerActions,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverTabBar(
                tabBar: customTabBarHeader(tabHeaders: tabHeaders),
              ),
            ),
          ];
        },
        body: TabBarView(
            physics: scrollPhysics,
            children: tabBodies.map<Widget>((tabs) => tabs).toList()),
      ),
    );
  }
}
