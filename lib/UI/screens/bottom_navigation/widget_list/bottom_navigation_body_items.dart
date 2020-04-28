import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/commonWidget/sliver/sliver_page.dart';
import 'package:thikana_ki/UI/screens/dashboard/dashboard_page.dart';
import 'package:thikana_ki/UI/screens/home/homePage.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_container_tab_headers_and_bodies.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_sliver_app_bar_item.dart';
import 'package:thikana_ki/UI/screens/home/widget_list/home_page_header_action_list.dart';

import '../../message/message.dart';
import '../../notification/notification.dart';
import '../../wishlist/wishlist.dart';

List<Widget> bottomNavigationBodyItems = [
  HomePage(),
  WishList(),
  MessageList(),
  NotificationList(),
  DashBoardPage(),
];
