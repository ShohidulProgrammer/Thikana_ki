import 'package:flutter/material.dart';

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
    MediaQuery.of(context).size.height;

    return Column(
      children: <Widget>[
        Container(
          decoration: new BoxDecoration(color: Colors.white),
//      decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
// home page container tab header icons
          child: new TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 0.0),
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
// math.max(MediaQuery.of(context).size.height-450.0, MediaQuery.of(context).size.height / widget.heightPart),
          child: new TabBarView(
            controller: _controller,
            children: widget.tabBodies,
          ),
        ),
      ],
    );
  }
}
