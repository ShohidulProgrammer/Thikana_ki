import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/widget_list/bottom_menu_item.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

import '../../../cores/utils/language/translate.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key key, this.bodyItems}) : super(key: key);
  final List<Widget> bodyItems;

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

//
//  @override
//  void initState() {
////    _fcmHandle();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    UIScreenSize.size = MediaQuery.of(context).size;
    UIScreenSize.height = UIScreenSize.size.height;
    UIScreenSize.weight = UIScreenSize.size.width;
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,

          ///List bottom menu body
          children: widget.bodyItems
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
