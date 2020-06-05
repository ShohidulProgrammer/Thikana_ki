//
//
//import 'package:custom_navigator/custom_scaffold.dart';
//import 'package:flutter/material.dart';
//import 'package:thikana_ki/UI/screens/bottom_navigation/test/widget/page.dart';
//import 'package:thikana_ki/UI/screens/bottom_navigation/widget_list/bottom_menu_item.dart';
//
//class MyCustomScaffold extends StatefulWidget {
//  @override
//  _MyCustomScaffoldState createState() => _MyCustomScaffoldState();
//}
//
//class _MyCustomScaffoldState extends State<MyCustomScaffold> {
//  @override
//  Widget build(BuildContext context) {
//    return CustomScaffold(
//      scaffold: Scaffold(
//        bottomNavigationBar: BottomNavigationBar(
//          items: bottomNavigationIconList
//              .map(
//                (BottomNavigationIcon navBarItem) => BottomNavigationBarItem(
//              icon: Icon(navBarItem.icon),
//              backgroundColor: navBarItem.color,
//              title: Text(navBarItem.title
////                Translate.of(context).translate(navBarItem.title)
//              ),
//            ),
//          )
//              .toList(),
//        ),
//      ),
//
//      // Children are the pages that will be shown by every click
//      // They should placed in order such as
//      // `page 0` will be presented when `item 0` in the [BottomNavigationBar] clicked.
//      children: <Widget>[
//        NavigationPage(child: HomePage(),),
//        NavigationPage(child: WishList(),),
//        NavigationPage(child: MessageList(),),
//        NavigationPage(child: NotificationList(),),
//        NavigationPage(child: DashBoardPage(),),
//      ],
//
//      // Called when one of the [items] is tapped.
//      onItemTap: (index) {},
//    );
//  }
//}
//
//
