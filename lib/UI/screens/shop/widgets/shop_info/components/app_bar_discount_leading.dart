import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';

import 'edit_shop_title.dart';

class Discount extends StatelessWidget {
  final int discount;
  final bool isEditor = true;

  const Discount({this.discount: 0});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Wrap(
        children: <Widget>[
          AppTag(
            'Upto $discount% OFF',
            type: TagType.offer,
          ),
        ],
      ),
      onPressed: () => isEditor
          ? editShopTitle(
              context: context,
              title: 'Sell Discount',
              labelText: 'Amount',
              hintText: '$discount')
          : null,
    );
  }
}
