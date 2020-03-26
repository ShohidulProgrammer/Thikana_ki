import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/widgets/shop/SmallCard.dart';
import 'package:thikana_ki/cores/models/screen_models/shop_model.dart';

class Shop extends StatelessWidget {

//  final double itemHeight = 200;
//  final double itemWidth = 150;

  @override
  Widget build(BuildContext context) {
    final title = "Discount Shop";
    final double itemHeight = MediaQuery.of(context).size.height /6;
    final double itemWidth = MediaQuery.of(context).size.width /3.5;

    return GridView.count(
        crossAxisCount: 3,
        childAspectRatio: (itemWidth / itemHeight),
        children: List.generate(shops.length, (index) {
          return Container(
              color: Colors.grey[100],
              child: SmallCard(shopModel: shops[index]));
        }));
  }
}
