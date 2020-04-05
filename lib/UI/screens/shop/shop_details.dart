//import 'package:flutter/material.dart';
//import 'package:thikana_ki/UI/commonWidget/sliver/sliver_page.dart';
//import 'package:thikana_ki/UI/widget_list/shop_details/shop_detail_page_sliver_banner_items.dart';
//import 'package:thikana_ki/UI/widget_list/shop_details/shop_detail_tabs.dart';
//import 'package:thikana_ki/cores/api/local_file_api.dart';
//import 'package:thikana_ki/cores/models/import_model.dart';
//
//
//class ShopDetails extends StatefulWidget {
//  @override
//  _ShopDetailsState createState() => _ShopDetailsState();
//}
//
//class _ShopDetailsState extends State<ShopDetails> {
//  bool _like = false;
//  bool _showHour = false;
//  ProductDetailPageModel _detailPage;
//  bool isEditor = false;
//  bool isOpen = false;
//
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
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SafeArea(
//        child: MyGenericSliverPage(
//          sliverHeaderItems: shopDetailPageSliverBannerItems,
//          sliverBodyItems: shopDetailPageSliverTabBarBodies,
//        ),
//      ),
//    );
//  }
//}
