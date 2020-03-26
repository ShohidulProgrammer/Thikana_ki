import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/genericUI/GoogleMap.dart';
import 'package:thikana_ki/UI/widgets/home/search_bar.dart';
import 'package:thikana_ki/UI/widgets/home/silver_tab_bar.dart';

import 'home_page_tabs.dart';

List<Widget> homePageSliverBannerItems = [
  MyGoogleMap(),
  SearchBar(),
  MyAbstractSilverTabBarHeader(tabHeaders: homePageTabHeaderIcons),
];
