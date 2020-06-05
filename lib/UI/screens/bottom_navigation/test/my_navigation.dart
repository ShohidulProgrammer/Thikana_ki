//give a navigator key to [MaterialApp] if you want to use the default navigation
//anywhere in your app eg: line 15 & line 93
import 'package:custom_navigator/custom_navigation.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/test/widget/page.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/widget_list/bottom_menu_item.dart';
import 'package:thikana_ki/UI/screens/dashboard/dashboard_page.dart';
import 'package:thikana_ki/UI/screens/home/homePage.dart';
import 'package:thikana_ki/UI/screens/message/message.dart';
import 'package:thikana_ki/UI/screens/notification/notification.dart';
import 'package:thikana_ki/UI/screens/wishlist/wishlist.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  NavigationPage _page = NavigationPage(child: HomePage(),) ;
  int _currentIndex = 0;

  // Custom navigator takes a global key if you want to access the
  // navigator from outside it's widget tree subtree
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavigationIconList
            .map(
              (BottomNavigationIcon navBarItem) => BottomNavigationBarItem(
                icon: Icon(navBarItem.icon),
                backgroundColor: navBarItem.color,
                title: Text(navBarItem.title
//                Translate.of(context).translate(navBarItem.title)
                    ),
              ),
            )
            .toList(),
//        items: _items,
        onTap: (index) {
          // here we used the navigator key to pop the stack to get back to our
          // main page
          navigatorKey.currentState.maybePop();
          setState(() =>
          _page = NavigationPage(child: HomePage(),));
          _currentIndex = index;
        },
        currentIndex: _currentIndex,
      ),
      body: CustomNavigator(
        navigatorKey: navigatorKey,
        home: _page,
        //Specify your page route [PageRoutes.materialPageRoute] or [PageRoutes.cupertinoPageRoute]
//        pageRoute: Router.generateRoute,
        pageRoute: PageRoutes.materialPageRoute,
      ),
    );
  }


}



