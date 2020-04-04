import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/carousel_banner/carousel_banner_image.dart';
import 'package:thikana_ki/UI/commonWidget/tab_bar/custom_tab_bar.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';
import 'package:thikana_ki/cores/api/local_file_api.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/models/import_model.dart';

import 'shop_info.dart';
import 'widget_list/shop_page_tab_bar_contents.dart';

class ShopProfile extends StatefulWidget {
  final bool isEditor;

  const ShopProfile({Key key, this.isEditor: false}) : super(key: key);

  @override
  _ShopProfileState createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile> {
  bool _like = false;
  bool _showHour = false;
  ProductDetailPageModel _detailPage;
  bool isEditor = false;
  bool isOpen = false;
  int discount = 50;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await LocalFileApi.getProductDetail();
    if (result.success) {
      setState(() {
        _detailPage = ProductDetailPageModel.fromJson(result.data);
        _like = _detailPage.like;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        leading: Wrap(
//          children: <Widget>[
//            AppTag(
//              'Upto $discount% OFF',
//              type: TagType.rateSmall,
//            ),
//          ],
//        ),
//        backgroundColor: Colors.transparent,
//        elevation: 0.0,
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//              _like ? Icons.favorite : Icons.favorite_border,
////                            color: Theme.of(context).primaryColorLight,
//            ),
//            onPressed: _onLike,
//          ),
//          isEditor
//              ? IconButton(
//                  icon: Icon(Icons.location_on),
//                  onPressed: () {
//                    _onLocation();
//                  })
//              : IconButton(
//                  icon: Icon(Icons.share),
//                  onPressed: () {
//                    _onShareLocation();
//                  }),
//        ],
//      ),
//      extendBodyBehindAppBar: true,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 355.0,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(

                  background: Column(
                    children: <Widget>[
                      CarouselBanner(),
                      ShopInfo(),
                    ],
                  ),
                ),
                leading: Wrap(
                  children: <Widget>[
                    AppTag(
                      'Upto $discount% OFF',
                      type: TagType.rateSmall,
                    ),
                  ],
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      _like ? Icons.favorite : Icons.favorite_border,
//                            color: Theme.of(context).primaryColorLight,
                    ),
                    onPressed: _onLike,
                  ),
                  isEditor
                      ? IconButton(
                          icon: Icon(Icons.location_on),
                          onPressed: () {
                            _onLocation();
                          })
                      : IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            _onShareLocation();
                          }),
                ],
              ),
            ];
          },
          body: Column(
            children: <Widget>[
                SizedBox(height: 15.0,),
              CustomContainerTabBar(
                tabHeaders: shopPageTabHeader,
                tabBodies: shopPageTabBarBodies,
                heightPart: 3,
              ),
            ],
          )

//          child: Column(
//        children: <Widget>[
//          CarouselBanner(),
//          ShopInfo(),
////          SearchInputField(
////            hintText: 'search_product',
////          ),
//          CustomContainerTabBar(
//            tabHeaders: shopPageTabHeader,
//            tabBodies: shopPageTabBarBodies,
//            heightPart: 3,
//          ),
//        ],
//      )),

          ),
    );
  }

  ///On like product
  void _onLike() {
    setState(() {
      _like = !_like;
    });
  }

  ///On navigate map
  void _onLocation() {
    Navigator.pushNamed(
      context,
      locationPageRoute,
      arguments: _detailPage.location,
    );
  }

  void _onShareLocation() {}
}

//      floatingActionButton: isEditor
//          ? AddProductionFloatingActionButton()
//          : SearchProductFloatingActionButton(),
