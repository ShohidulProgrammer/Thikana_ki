import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/screens/bottom_navigation/widget_list/bottom_menu_item.dart';

class CupertinoHomeScaffold extends StatelessWidget {
  const CupertinoHomeScaffold({
    Key key,
    @required this.currentTab,
    @required this.onSelectTab,
    @required this.widgetBuilders,
    @required this.navigatorKeys,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final Map<TabItem, WidgetBuilder> widgetBuilders;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.white,
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            _buildItem(context: context, tabItem: TabItem.home),
            _buildItem(context: context, tabItem: TabItem.wishList),
            _buildItem(context: context, tabItem: TabItem.chat),
            _buildItem(context: context, tabItem: TabItem.notification),
            _buildItem(context: context, tabItem: TabItem.dashBoard),
          ],
          onTap: (index) => onSelectTab(TabItem.values[index]),
        ),
        tabBuilder: (context, index) {
          final item = TabItem.values[index];
          return CupertinoTabView(
            navigatorKey: navigatorKeys[item],
            builder: (context) => widgetBuilders[item](context),
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {@required BuildContext context, @required TabItem tabItem}) {
    final itemData = BottomTabItemData.allBottomTabs[tabItem];
    final color = currentTab == tabItem
        ? Theme.of(context).primaryColor
        : Theme.of(context).unselectedWidgetColor;
    return BottomNavigationBarItem(
      icon: Icon(
        itemData.icon,
        color: color,
      ),
      title: Text(
        itemData.title,
        style: TextStyle(color: color),
      ),
    );
  }
}
