import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/app_button.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/search_input_field.dart';
import 'package:thikana_ki/UI/commonWidget/list/custom_sererator_list_factory.dart';

import 'product_list_tile.dart';

class ProductsInShop extends StatefulWidget {
  @override
  _ProductsInShopState createState() => _ProductsInShopState();
}

class _ProductsInShopState extends State<ProductsInShop> {
  bool isEditor = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5.0,
      ),
      child: Column(
        children: <Widget>[
          isEditor
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    text: 'Add New Product',
                    onPressed: () {
                      // Todo: Add Products
                    },
                    disableTouchWhenLoading: true,
                  ),
                )
              : Container(
                  color: Colors.purpleAccent,
                ),
          SearchInputField(
            hintText: 'search_product',
          ),
          Expanded(
            child: CustomSeparatorListFactory(
              child: ProductListTile(
                productName: 'Product Name',
                category: "Product Category",
                price: "50 /=",
              ),
            ),
          ),
        ],
      ),
//
    );
  }
}
