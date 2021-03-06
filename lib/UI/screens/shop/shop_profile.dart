import 'package:flutter/material.dart';

import 'package:thikana_ki/UI/screens/shop/widgets/shop_info/components/app_bar_discount_leading.dart';
import 'package:thikana_ki/cores/api/local_file_api.dart';
import 'package:thikana_ki/cores/configs/router/go_next_page.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/cores/models/import_model.dart';
import 'widgets/shop_info/components/banner_image_edit_form.dart';
import 'widgets/shop_info/components/edit_shop_widget.dart';
import 'widgets/shop_page_body.dart';

class ShopProfile extends StatefulWidget {
  final bool isEditor;

  const ShopProfile({Key key, this.isEditor: false}) : super(key: key);

  @override
  _ShopProfileState createState() => _ShopProfileState();
}

class _ShopProfileState extends State<ShopProfile> {
  bool _like = false;
  // bool _showHour = false;
  ProductDetailPageModel _detailPage;
  bool isEditor = true;
  bool isOpen = false;

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
      appBar: AppBar(
        title: Discount(
          discount: 50,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.blueGrey[600],
            child: isEditor
                ? IconButton(
                    icon: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                    onPressed: () => editShopInfo(
                      context: context,
                      title: 'Add Banner Image',
                      child: BannerImageEditForm(),
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      _like ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: _onLike,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange[600],
              child: isEditor
                  ? IconButton(
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _onLocation();
                      })
                  : IconButton(
                      icon: Icon(Icons.share),
                      color: Colors.white,
                      onPressed: () {
                        _onShareLocation();
                      }),
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ShopPageBody(),
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
    openRoutePage(
      context: context,
      route: locationPageRoute,
      arguments: _detailPage.location,
    );
    // Navigator.pushNamed(
    //   context,
    //   locationPageRoute,
    //   arguments: _detailPage.location,
    // );
  }

  void _onShareLocation() {}
}

//Widget _buildBannerImageEditForm() {
//  return Container(
//    height: 280.0,
//    child: ListView.builder(
//      padding: EdgeInsets.all(0.0),
//        itemCount: 5,
//        itemBuilder: (context, index) {
//          return InkWell(
//            onTap:()=> customBottomSheet(
//                context: context, child: ImageSourceTypeSelectorForm()),
//            child: ListTile(
//              leading:  Icon(Icons.image),
//              title: Text(
//                'Banner Image : ${index+1}',
//              ),
//            ),
//          );
//        }),
//  );
//}

//ListTile()

//      floatingActionButton: isEditor
//          ? AddProductionFloatingActionButton()
//          : SearchProductFloatingActionButton(),
