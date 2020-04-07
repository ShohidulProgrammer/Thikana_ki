import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/tag/app_tag.dart';

class Discount extends StatelessWidget {
  final int discount;

  const Discount({this.discount: 0});
  @override
  Widget build(BuildContext context) {
    return  Wrap(
      children: <Widget>[
        AppTag(
          'Upto $discount% OFF',
          type: TagType.rateSmall,
        ),
      ],
    );
  }
}
