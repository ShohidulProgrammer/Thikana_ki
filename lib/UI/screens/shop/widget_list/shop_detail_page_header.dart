import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/carousel_banner/carousel_banner_image.dart';
import 'package:thikana_ki/UI/commonWidget/painter/border_line.dart';
import 'package:thikana_ki/UI/screens/shop/widgets/shop_info/shop_info.dart';

List<Widget> shopDetailPageAppBarHeaders = [
  CarouselBanner(),
  ShopInfo(
    isEditor: true,
  ),
  BorderLine(),
//  CustomTabBarHeader(tabHeaders: homePageTabHeader),
];
