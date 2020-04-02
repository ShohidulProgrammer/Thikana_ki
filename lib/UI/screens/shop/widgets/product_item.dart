import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String category;
  final String price;

  const ProductItem({this.productName, this.category, this.price});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: new Container(
        color: const Color.fromARGB(0, 245, 245, 245),
        child: new Column(
          children: <Widget>[
            new Column(
              children: <Widget>[
                Container(
                    padding: new EdgeInsets.all(8.0),
                    // what ever padding you want add here
                    child: Row(
                      children: <Widget>[

                        new Expanded(
                          child: new Text('$productName\n$category'),
                        ),
                        new  Text(price),
                      ],
                    )),
                Divider(
                  height: 1.0,
                  color: Colors.grey[200],
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
