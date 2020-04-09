import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/carousel_banner/carousel_banner_image.dart';
import 'package:thikana_ki/UI/commonWidget/tab_bar/custom_tab_bar.dart';
import 'package:thikana_ki/UI/screens/shop/widget_list/shop_page_tab_bar_contents.dart';

import 'shop_info.dart';

class ShopPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CarouselBanner(),
          ShopInfo(
            isEditor: true,
          ),
          SizedBox(height: 5.0,),
          CustomContainerTabBar(
            tabHeaders: shopPageTabHeader,
            tabBodies: shopPageTabBarBodies,
            heightPart: 1.6,
          ),
        ],
      ),
    );
  }
}

////          child: Column(
////        children: <Widget>[
////          CarouselBanner(),
////          ShopInfo(),
//////          SearchInputField(
//////            hintText: 'search_product',
//////          ),
////          CustomContainerTabBar(
////            tabHeaders: shopPageTabHeader,
////            tabBodies: shopPageTabBarBodies,
////            heightPart: 3,
////          ),
////        ],
////      )),
//
//          ),
