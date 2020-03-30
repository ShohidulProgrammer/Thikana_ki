import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/screens/home/widgets/silver_tab_bar.dart';
import '../../../UI/commonWidget/carousel_banner_image.dart';


import 'shop_detail_tabs.dart';

List<Widget> shopDetailPageSliverBannerItems = [
  CarouselBanner(),
  MyAbstractSilverTabBarHeader(tabHeaders: shopDetailPageTabHeaderIcons),
];
