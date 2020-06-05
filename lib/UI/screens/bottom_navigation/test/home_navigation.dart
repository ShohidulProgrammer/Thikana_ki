import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/mobile_screen_size.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';
import '../../../../cores/utils/language/translate.dart';
import '../widget_list/bottom_menu_item.dart';
import '../widget_list/bottom_navigation_body_items.dart';
import '../../../commonWidget/drawer/drawer_menu.dart';

class HomeMainNavigation extends StatefulWidget {

  @override
  _HomeMainNavigationState createState() => _HomeMainNavigationState();
}

class _HomeMainNavigationState extends State<HomeMainNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
//    _fcmHandle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UIScreenSize.size = MediaQuery.of(context).size;
    UIScreenSize.height = UIScreenSize.size.height;
    UIScreenSize.weight = UIScreenSize.size.width;
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
          items: bottomNavigationIconList
              .map(
                (BottomNavigationIcon navBarItem) => BottomNavigationBarItem(
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
