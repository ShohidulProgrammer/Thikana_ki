import 'package:flutter/material.dart';

class MyAbstractSliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final List<Widget> children;
  final Alignment alignment;

//  final List<ImageModel> banners;

  MyAbstractSliverAppBar({this.expandedHeight, this.children, this.alignment});

  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    return Stack(alignment: alignment, children: children.map((Widget child)=> child).toList());
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
