//import 'package:flutter/material.dart';
//import 'package:thikana_ki/cores/api/api.dart';
//import 'package:thikana_ki/cores/models/import_model.dart';
//
//import 'category_icon.dart';
//
//class EmergencyIcons extends StatefulWidget {
//  @override
//  _EmergencyIconsState createState() => _EmergencyIconsState();
//}
//
//
//class _EmergencyIconsState extends State<EmergencyIcons> {
//  HomePageModel _homePage;
//
////  @override
////  void initState() {
////    _loadData();
////    super.initState();
////  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    return EmergencyCategoryIcons(homePageModel: _homePage);
//  }
////
////  ///Fetch API
////  Future<void> _loadData() async {
////    final ResultApiModel result = await Api.getHome();
////    if (result.success) {
////      final more = CategoryModel.fromJson({
////        "id": 8,
////        "name": 'more', // Translate.of(context).translate('more'),
////        "icon": "more_horiz",
////        "color": "#ff8a65",
////        "route": "category"
////      });
////
////      _homePage = HomePageModel.fromJson(result.data);
////      _homePage.category.add(more);
////      setState(() {
////        _homePage = _homePage;
////      });
////    }
////  }
//}
