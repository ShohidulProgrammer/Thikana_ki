import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/custom_sliver_tab_bar.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import 'silver_tab_bar.dart';

class MyGenericSliverPage extends StatelessWidget {
  final List<Widget> sliverHeadersList;
  final List<Widget> headerActionList;
  final List<Widget> tabBarHeaderList;
  final List<Widget> tabBodiesList;
  final SliverPersistentHeaderDelegate delegate;

  const MyGenericSliverPage(
      {Key key,
      this.delegate,
      this.sliverHeadersList,
      this.headerActionList,
      this.tabBarHeaderList,
      this.tabBodiesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return DefaultTabController(
      length: tabBarHeaderList.length ?? 0,
//      length: tabBodiesList.length ?? 0,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: UIScreenSize.size.height / 1.66,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: sliverHeadersList,
                ),
              ),
              actions: headerActionList,
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverTabBar(
                tabBar: customTabBarHeader(tabHeaders: tabBarHeaderList),
              ),
            ),
          ];
        },
        body: TabBarView(
            children: tabBodiesList.map<Widget>((tabs) => tabs).toList()),
      ),
    );
  }
}
