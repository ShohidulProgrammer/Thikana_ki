import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/rating/app_star_rating.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';
import 'package:thikana_ki/cores/api/local_file_api.dart';
import 'package:thikana_ki/cores/configs/config.dart';
import 'package:thikana_ki/cores/models/import_model.dart';

import 'shop_current_status.dart';

class ShopInfo extends StatefulWidget {
  @override
  _ShopInfoState createState() => _ShopInfoState();
}

class _ShopInfoState extends State<ShopInfo> {
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

              ShopCurrentStatus(
                currentStatus: _detailPage.status,
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
              IconButton(
                  icon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.chat,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  onPressed: () {}),
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
