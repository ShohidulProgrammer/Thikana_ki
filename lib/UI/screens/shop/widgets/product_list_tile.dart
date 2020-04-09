import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/list/custom_list_tile.dart';

class ProductListTile extends CustomListTile {
  ProductListTile(
      {@required String productName,
      String category,
      String currentPrice,
      String originalPrice})
      : super(
          title: Text(productName),
          subTitle: Text(category),
          leading: Image(
            fit: BoxFit.contain,
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRWGZwosxytRt0Xl_3g5-7eXOTELA0fGDvzP-OwTC3oi9IroOJ_&usqp=CAU'),
          ),
          trailing: RichText(
            text: new TextSpan(
//        text: currentPrice,
              children: <TextSpan>[
                new TextSpan(
                  text: originalPrice,
                  style: new TextStyle(
                    color: Colors.red[300],
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                TextSpan(
                  text: '\n$currentPrice',
                  style: new TextStyle(
                      color: Colors.blueGrey[900], fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        );
}
