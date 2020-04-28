import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/models/screen_models/product_detail_page_model.dart';

import 'contact_info_item_widget.dart';
import 'contact_info_shop_open_time.dart';
import 'social_contact.dart';

class ShopContactAddress extends StatelessWidget {
  final ProductDetailPageModel detailPage;

  const ShopContactAddress({@required this.detailPage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // address
          ContactInfoItem(
            icon: Icons.location_on,
            label: 'address',
            title: detailPage.address,
          ),
          // phone
          ContactInfoItem(
            icon: Icons.phone,
            label: 'phone',
            title: detailPage.phone,
          ),
          // email
          ContactInfoItem(
            icon: Icons.email,
            label: 'email',
            title: detailPage.email,
          ),
          // website
          ContactInfoItem(
            icon: Icons.language,
            label: 'website',
            title: detailPage.website,
          ),
          // open time
          ContactInfoShopOpenTime(
            hour: detailPage.hour,
            hourDetail: detailPage.hourDetail,
          ),
          // social icons
          SocialContact(),
          // shop description
          Padding(
            padding: EdgeInsets.only(top: 20),
          ),
          Text(
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n'
            '${detailPage.description}\n',
//              overflow: TextOverflow.ellipsis,
//              maxLines: 15,
            style: Theme.of(context).textTheme.body2.copyWith(height: 1.3),
          ),

// shop established date and price range

//          Padding(
//            padding: EdgeInsets.only(top: 20, bottom: 20),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      Translate.of(context).translate('date_established'),
//                      style: Theme.of(context).textTheme.caption,
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 3),
//                      child: Text(
//                        _detailPage.date,
//                        style: Theme.of(context)
//                            .textTheme
//                            .subtitle
//                            .copyWith(fontWeight: FontWeight.w600),
//                      ),
//                    )
//                  ],
//                ),
//                Column(
//                  crossAxisAlignment: CrossAxisAlignment.end,
//                  children: <Widget>[
//                    Text(
//                      Translate.of(context).translate('price_range'),
//                      style: Theme.of(context).textTheme.caption,
//                    ),
//                    Padding(
//                      padding: EdgeInsets.only(top: 3),
//                      child: Text(
//                        _detailPage.priceRange,
//                        style: Theme.of(context)
//                            .textTheme
//                            .subtitle
//                            .copyWith(fontWeight: FontWeight.w600),
//                      ),
//                    )
//                  ],
//                )
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
}
