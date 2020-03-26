import 'package:flutter/widgets.dart';
import '../../../UI/genericUI/carousel_banner_image.dart';
import '../../../UI/widgets/home/silver_tab_bar.dart';

import 'shop_detail_tabs.dart';

List<Widget> shopDetailPageSliverBannerItems = [
  CarouselBanner(),
  MyAbstractSilverTabBarHeader(tabHeaders: shopDetailPageTabHeaderIcons),
];
