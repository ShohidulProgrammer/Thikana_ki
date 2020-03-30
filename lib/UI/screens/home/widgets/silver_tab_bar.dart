import 'package:flutter/material.dart';

class MyAbstractSilverTabBarHeader extends StatelessWidget {
  final List<Widget> tabHeaders;

  const MyAbstractSilverTabBarHeader({Key key, this.tabHeaders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0, top: 10.0),
        child: Card(
          child: TabBar(
            isScrollable: true,
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.grey,
            tabs: tabHeaders.map((tab) => tab).toList(),
          ),
        ),
      ),
    );
  }
}
