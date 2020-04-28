import 'package:flutter/material.dart';

class CustomSliverHeader extends SliverPersistentHeaderDelegate {
  final List<Widget> children;
  final double expandedHeight;
  final Alignment alignment;

  CustomSliverHeader({this.children, this.expandedHeight, this.alignment});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(children: children.map((Widget child) => child).toList());
//
//    return Stack(
//        alignment: alignment,
//        children: children.map((Widget child) => child).toList());
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
