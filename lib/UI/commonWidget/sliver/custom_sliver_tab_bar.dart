import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/painter/border_line.dart';

class CustomSliverTabBar extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  CustomSliverTabBar({this.tabBar});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
//      padding: EdgeInsets.only(top: 22.0),
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
//  double get minExtent => 25;
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
