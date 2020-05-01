import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/screens/dashboard/dashboard_page.dart';
import 'package:thikana_ki/UI/screens/home/homePage.dart';
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
