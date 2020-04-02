import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_container_tab_headers_and_bodies.dart';
import 'package:thikana_ki/UI/screens/shop/widget_list/shop_page_tab_bar_contents.dart';

class CustomContainerTabBar extends StatefulWidget {
  final List<Widget> tabHeaders;
  final List<Widget> tabBodies;
  final double heightPart;

  const CustomContainerTabBar({
    @required this.tabHeaders,
    @required this.tabBodies,
    this.heightPart: 3,
  });

  @override
  _CustomContainerTabBarState createState() => _CustomContainerTabBarState();
}

class _CustomContainerTabBarState extends State<CustomContainerTabBar>
    with SingleTickerProviderStateMixin {
  TabController _controller;


  @override
  void initState() {
    super.initState();
    _controller =
        new TabController(length: widget.tabHeaders.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.tabHeaders == null || widget.tabBodies == null) {
      return Center(child: CircularProgressIndicator());
    }
    print('header length: ${widget.tabHeaders}');

    return Column(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(color: Colors.white),
//      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
          // home page container tab header icons
          child: new TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            controller: _controller,
            tabs: widget.tabHeaders,
//            tabs: widget.tabHeaders == homePageTabHeader ? homePageTabHeader: shopPageTabHeader ,
          ),
        ),
        // home page container tab bodies

        Container(
          height: MediaQuery.of(context).size.height / widget.heightPart,
          child: new TabBarView(
            controller: _controller,
//            children: homePageTabBarBodies,
            children: widget.tabBodies,
          ),
        ),
      ],
    );
  }
}
