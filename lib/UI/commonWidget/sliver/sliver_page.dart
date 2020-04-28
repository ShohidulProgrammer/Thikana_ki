//import 'package:flutter/material.dart';
//
//class MyGenericSliverPage extends StatelessWidget {
//  final List<Widget> sliverHeadersList;
//
//  final List<Widget> headerActionList;
//  final List<Widget> tabBarHeaderList;
//  final List<Widget> tabBodiesList;
//
//  const MyGenericSliverPage(
//      {this.sliverHeadersList,
//      this.headerActionList,
//      this.tabBarHeaderList,
//      this.tabBodiesList});
//
//  @override
//  Widget build(BuildContext context) {
//    return NestedScrollView(
//      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//        return sliverHeadersList.map((header) => header).toList();
//      },
//      body: TabBarView(
//          children: tabBodiesList.map<Widget>((tabs) => tabs).toList()),
//    );
//  }
//}
