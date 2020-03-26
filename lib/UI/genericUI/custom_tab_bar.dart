import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/data_list/home/home_page_tabs.dart';

class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: homePageTabHeaderIcons.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(color: Colors.white),
//      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
          child: new TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _controller,
            tabs: homePageTabHeaderIcons
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height/3,
          child: new TabBarView(
            controller: _controller,
            children: homePageTabBarBodies,
          ),
        ),
      ],
    );
  }
}
