import 'package:flutter/cupertino.dart';
import 'package:thikana_ki/UI/commonWidget/list/custom_list_tile.dart';

class ProductListTile extends CustomListTile {
  ProductListTile({@required String productName, String category, String price})
      : super(
          title: Text(productName),
          subTitle: Text(category),
          trailing: Text(price),
        );
}
