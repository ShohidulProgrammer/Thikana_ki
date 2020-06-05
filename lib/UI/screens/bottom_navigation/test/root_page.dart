import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/widget_list/bottom_menu_item.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/widgets/cupertino_home_scaffold.dart';
import 'package:thikana_ki/UI/screens/dashboard/dashboard_page.dart';
import 'package:thikana_ki/UI/screens/home/homePage.dart';
import 'package:thikana_ki/UI/screens/message/message.dart';
import 'package:thikana_ki/UI/screens/notification/notification.dart';
import 'package:thikana_ki/UI/screens/wishlist/wishlist.dart';
import 'package:thikana_ki/cores/utils/theme/device_screen_size.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  TabItem _currentTab = TabItem.home;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.wishList: GlobalKey<NavigatorState>(),
    TabItem.chat: GlobalKey<NavigatorState>(),
    TabItem.notification: GlobalKey<NavigatorState>(),
    TabItem.dashBoard: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, WidgetBuilder> get allBottomNavigationPages {
    return {
      TabItem.home: (_) => HomePage(),
      TabItem.wishList: (_) => WishList(),
      TabItem.chat: (_) => MessageList(),
      TabItem.notification: (_) => NotificationList(),
      TabItem.dashBoard: (_) => DashBoardPage(),
    };
  }

  void _select(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      navigatorKeys[tabItem].currentState.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    UIScreenSize.size = MediaQuery.of(context).size;
    UIScreenSize.height = UIScreenSize.size.height;
    UIScreenSize.weight = UIScreenSize.size.width;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async =>
            !await navigatorKeys[_currentTab].currentState.maybePop(),
        child: CupertinoHomeScaffold(
          currentTab: _currentTab,
          onSelectTab: _select,
          widgetBuilders: allBottomNavigationPages,
          navigatorKeys: navigatorKeys,
        ),
      ),
    );
  }
}
