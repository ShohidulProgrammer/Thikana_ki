import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/screens/home/homePage.dart';
import '../../../UI/screens/message/message.dart';
import '../../../UI/screens/notification/notification.dart';
import '../../../UI/screens/wishlist/wishlist.dart';


List<Widget> bottomNavigationBodyItems = [
  HomePage(),
  WishList(),
  MessageList(),
  NotificationList(),
];



//  MyGenericSliverPage(
//    sliverHeaderItems: homePageSliverBannerItems,
//    sliverBodyItems: homePageSliverTabBarBodies,
//  ),