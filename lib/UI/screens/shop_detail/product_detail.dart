import 'dart:async';

import 'package:flutter/material.dart';
import '../../data_list/home/home_page_tabs.dart';
import '../../genericUI/sliver_page.dart';
import '../../../cores/configs/router/router_path_constants.dart';
import '../../../cores/utils/language/translate.dart';
import '../../genericUI/carousel_banner_image.dart';
import '../../../cores/models/model_result_api.dart';
import '../../widgets/product_list/app_star_rating.dart';
import '../../widgets/product_list/app_tag.dart';
import '../../../cores/api/api.dart';
import '../../../cores/configs/config.dart';
import '../../../cores/models/screen_models/screen_models.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key}) : super(key: key);

  @override
  _ProductDetailState createState() {
    return _ProductDetailState();
  }
}

class _ProductDetailState extends State<ProductDetail> {
  bool _like = false;
  bool _showHour = false;
  ProductDetailPageModel _detailPage;
  bool isEditor = false;
  bool isOpen = false;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  ///Fetch API
  Future<void> _loadData() async {
    final ResultApiModel result = await Api.getProductDetail();
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
      extendBody: true,
      body: NestedScrollView(
        headerSliverBuilder: (context, bool) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              title: AppTag(
                'Upto 10% Discount',
                type: TagType.status,
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
                          _onPhotoPreview;
                        }),
              ],
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: _buildBanner(),
              ),
            ),
          ];
        },
        body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: MyGenericSliverPage(
              sliverBodyItems: homePageTabBarBodies,
            ),
          ),
        ),
      ),
    );
  }

  ///Build banner UI
  Widget _buildBanner() {
    if (_detailPage?.banner == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          color: Colors.white,
        ),
      );
    }

    return CarouselBanner();

//    return Image.asset(
//      _detailPage.banner,
//      fit: BoxFit.cover,
//    );
  }

  ///Build info
  Widget _buildInfo() {
    if (_detailPage == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  top: 20,
                ),
                height: 10,
                width: 150,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 10,
                        width: 100,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                      ),
                      Container(
                        height: 20,
                        width: 150,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    color: Colors.white,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                        ),
                        Container(
                          height: 10,
                          width: 200,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                        ),
                        Container(
                          height: 10,
                          width: 200,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                        ),
                        Container(
                          height: 10,
                          width: 200,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                        ),
                        Container(
                          height: 10,
                          width: 200,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 10,
                          width: 100,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                        ),
                        Container(
                          height: 10,
                          width: 200,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Container(height: 10, width: 50, color: Colors.white),
              )
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _detailPage.title,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: _onLike,
              ),
              IconButton(
                icon: Icon(
                  Icons.chat,
                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: _onLike,
              ),
              // love icon for like shop
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
//                onTap: _onReview,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${_detailPage.subtitle}",
                      style: Theme.of(context).textTheme.body2,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AppTag(
                          "${_detailPage.rate}",
                          type: TagType.rateSmall,
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        StarRating(
                          rating: _detailPage.rate,
                          size: 14,
                          color: AppTheme.yellowColor,
                          borderColor: AppTheme.yellowColor,
                          onRatingChanged: (v) {
//                            _onReview();
                          },
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(
                          "(${_detailPage.numRate})",
                          style: Theme.of(context).textTheme.body2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
//              _detailPage.status == 'Open' ?
              AppTag(
                "${isOpen ? _detailPage.status : '\t\t\t\t\tClosed \nOpen At : 11 pm'}",
                type: TagType.status,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).dividerColor,
                  ),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Translate.of(context).translate('address'),
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          _detailPage.address,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).dividerColor,
                  ),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Translate.of(context).translate('phone'),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        _detailPage.phone,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).dividerColor),
                  child: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        Translate.of(context).translate('email'),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        _detailPage.email,
                        style: Theme.of(context)
                            .textTheme
                            .body2
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).dividerColor),
                  child: Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          Translate.of(context).translate('website'),
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Text(
                          _detailPage.website,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: Theme.of(context)
                              .textTheme
                              .body2
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _showHour = !_showHour;
              });
            },
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).dividerColor,
                        ),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              Translate.of(context).translate('open_time'),
                              style: Theme.of(context).textTheme.caption,
                            ),
                            Text(
                              _detailPage.hour,
                              style: Theme.of(context)
                                  .textTheme
                                  .body2
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _showHour
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                )
              ],
            ),
          ),
          Visibility(
            visible: _showHour,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _detailPage.hourDetail.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: 1,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    left: 42,
                  ),
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        Translate.of(context).translate(item['title']),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Text(
                        item['time'] == 'day_off'
                            ? Translate.of(context).translate('day_off')
                            : item['time'],
                        style: Theme.of(context).textTheme.caption.copyWith(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            _detailPage.description,
//              overflow: TextOverflow.ellipsis,
//              maxLines: 15,
            style: Theme.of(context).textTheme.body2.copyWith(height: 1.3),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Translate.of(context).translate('date_established'),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        _detailPage.date,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      Translate.of(context).translate('price_range'),
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(
                        _detailPage.priceRange,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
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

  ///On navigate gallery
  void _onPhotoPreview() {
    Navigator.pushNamed(
      context,
      galleryPageRoute,
      arguments: _detailPage.photo,
    );
    print("photo preview taped");
  }

//  ///On navigate product detail
//  void _onProductDetail() {
//    Navigator.pushNamed(context, Routes.productDetail);
//  }
//
//  ///On navigate review
//  void _onReview() {
//    Navigator.pushNamed(context, Routes.review);
//  }

}
