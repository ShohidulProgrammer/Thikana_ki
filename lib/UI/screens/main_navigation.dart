import 'package:flutter/material.dart';

import '../../cores/utils/language/translate.dart';
import '../data_list/home/bottom_menu_item.dart';
import '../data_list/home/bottom_navigation_body_items.dart';
import '../widgets/drawer/drawer_menu.dart';

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
//    _fcmHandle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        body: IndexedStack(
          index: _selectedIndex,

          ///List bottom menu body
          children: bottomNavigationBodyItems
              .map((Widget navBarBodyItem) => navBarBodyItem)
              .toList(),
        ),

        ///List bottom menu
        bottomNavigationBar: BottomNavigationBar(
          items: allBottomMenuItems
              .map(
                (BottomMenuItem navBarItem) => BottomNavigationBarItem(
                  icon: Icon(navBarItem.icon),
                  backgroundColor: navBarItem.color,
                  title:
                      Text(Translate.of(context).translate(navBarItem.title)),
                ),
              )
              .toList(),
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Theme.of(context).unselectedWidgetColor,
          selectedItemColor: Theme.of(context).primaryColor,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ));
  }

  ///On change tab bottom menu
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
