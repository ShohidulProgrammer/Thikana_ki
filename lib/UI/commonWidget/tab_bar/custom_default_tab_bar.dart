import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDefaultTabBar extends StatelessWidget {
  final List<Widget> headerList;
  final List<Widget> tabBodiesList;

  const CustomDefaultTabBar({this.headerList, this.tabBodiesList});

  @override
  Widget build(BuildContext context) {
    // change status bar color
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return DefaultTabController(
      length: tabBodiesList.length ?? 0,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return headerList.map((headerItem) => headerItem).toList();
        },
        body: TabBarView(
            children: tabBodiesList.map<Widget>((tabs) => tabs).toList()),
      ),
    );
  }
}
