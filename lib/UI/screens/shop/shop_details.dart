import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/tab_bar/custom_default_tab_bar.dart';
import 'package:thikana_ki/cores/configs/auth/user_role.dart';

import 'widget_list/shop_detail_page_header.dart';
import 'widget_list/shop_page_header_actions.dart';
import 'widget_list/shop_page_tab_bar_contents.dart';

class ShopDetails extends StatelessWidget {
  final USER_ROLE_TYPE userRoleType;

  ShopDetails({this.userRoleType: USER_ROLE_TYPE.normalUser});

  final bool _like = false;

//  bool _showHour = false;
//  ProductDetailPageModel _detailPage;
//  bool isOpen = false;

//  @override
//  void initState() {
//    _loadData();
//    super.initState();
//  }
//
//  ///Fetch API
//  Future<void> _loadData() async {
//    final ResultApiModel result = await LocalFileApi.getProductDetail();
//    if (result.success) {
//      setState(() {
//        _detailPage = ProductDetailPageModel.fromJson(result.data);
//        _like = _detailPage.like;
//      });
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomDefaultTabBar(
        appBarHeaders: shopDetailPageAppBarHeaders,
        headerActions: userRoleType == USER_ROLE_TYPE.editor
            ? shopDetailPageEditorHeaderActions
            : shopDetailPageUserHeaderActions(like: _like),
        tabHeaders: shopPageTabHeader,
        tabBodies: shopPageTabBarBodies,
        scrollPhysics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
