import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../cores/api/api.dart';
import '../../../UI/sharing_components/build_popular.dart';
import '../../../cores/models/import_model.dart';
import '../../../cores/models/screen_models/screen_models.dart';
import '../../../UI/widgets/home/category_title.dart';

import 'category_icon.dart';

class TabBarBody extends StatefulWidget {
  @override
  _TabBarBodyState createState() => _TabBarBodyState();
}

class _TabBarBodyState extends State<TabBarBody> {
  final _controller = RefreshController(initialRefresh: false);
  HomePageModel _homePage;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: ListView(
        children: <Widget>[
//          EmergencyCategoryIcons(homePageModel: _homePage),
////          _buildCategory(),
//          SizedBox(height: 10.0),
          // emergency title
          CategoryTitle(
              title: 'emergency', image: 'assets/images/emergency.png'),
          Container(
            height: 195,
            child: CategoryImageCardFactory(homePageModel: _homePage),
//            child: _buildPopular(),
          ),
          CategoryTitle(title: 'restaurants', image: 'assets/images/offers.png'),
          Container(
            height: 195,
            child: CategoryImageCardFactory(homePageModel: _homePage),
          ),
          CategoryTitle(title: 'partners', image: 'assets/images/partners.png'),
          Container(
            height: 195,
            child: CategoryImageCardFactory(homePageModel: _homePage),
          ),
        ],
      ),
    );
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await Api.getHome();
    if (result.success) {
      final more = CategoryModel.fromJson({
        "id": 8,
        "name": 'more', // Translate.of(context).translate('more'),
        "icon": "more_horiz",
        "color": "#ff8a65",
        "route": "category"
      });

      _homePage = HomePageModel.fromJson(result.data);
      _homePage.category.add(more);
      setState(() {
        _homePage = _homePage;
      });
    }
  }

  ///On load more
  Future<void> _onMore() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.loadComplete();
  }

  ///On navigate product detail
  void _onProductDetail() {
//    Navigator.pushNamed(context, Routes.productDetail);
  }

  ///On refresh
  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    _controller.refreshCompleted();
  }
}
