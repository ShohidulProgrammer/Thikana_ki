import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thikana_ki/UI/commonWidget/rating/app_star_rating.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';
import 'package:thikana_ki/cores/api/local_file_api.dart';
import 'package:thikana_ki/cores/configs/config.dart';
import 'package:thikana_ki/cores/models/import_model.dart';

import 'components/edit_shop_title.dart';
import 'components/shop_current_status.dart';

class ShopInfo extends StatefulWidget {
  final bool isEditor;

  const ShopInfo({this.isEditor: false});

  @override
  _ShopInfoState createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
  bool _like = false;
  bool _showHour = false;
  ProductDetailPageModel _detailPage;
  bool isOpen = true;

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
    bool _obscureText = false;
    if (_detailPage == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      padding: EdgeInsets.only(left: 2, right: 20),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                onPressed: () => widget.isEditor
                    ? editShopTitle(
                        context: context,
                        title: 'Business Name',
                        labelText: 'Name',
                        hintText: _detailPage.title)
                    : null,
                child: Text(
                  _detailPage.title,
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),

              // shop open or close status
              ShopCurrentOpenCloseStatus(
                currentStatus: _detailPage.status,
              ),

              // love icon for like shop
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    onPressed: () => widget.isEditor
                        ? editShopTitle(
                            context: context,
                            title: 'Shop Category',
                            labelText: 'Category',
                            hintText: _detailPage.subtitle)
                        : null,
                    child: Text(
                      "${_detailPage.subtitle}",
                      style: Theme.of(context).textTheme.body2,
                    ),
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
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.phoneAlt,
//                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: () => widget.isEditor
                    ? editShopTitle(
                        context: context,
                        title: 'Business Mobile Number',
                        labelText: 'Mobile No',
                        hintText: '01944700')
                    :
                    // # ToDo: Call to this number
                    print('Call to this number'),
              ),
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.rocketchat,
//                  color: Theme.of(context).primaryColorLight,
                ),
                onPressed: () => widget.isEditor
                    ? editShopTitle(
                        context: context,
                        title: 'Business Chat',
                        labelText: 'Chat address',
                        hintText: 'user name')
                    :
                    // # ToDo: Chat to this shop
                    print('Chat to this shop'),
              ),
              widget.isEditor
                  ? IconButton(
                      icon: Icon(_obscureText ? FontAwesomeIcons.eye : FontAwesomeIcons.eyeSlash,),
//                      icon: Icon(Icons.publish),
                      tooltip: 'Publish',
                      onPressed: () {
                        // # ToDo: Publish ON/OFF
                      },
                    )
                  : Container(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
  }
}
