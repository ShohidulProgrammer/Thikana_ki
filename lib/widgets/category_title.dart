import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final String image;

  const CategoryTitle({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
//                          Translate.of(context).translate('popular_location'),
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(width: 10.0),
          Container(
            child: Image(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
            height: 25,
            width: 25,
          ),
        ],
      ),
    );
  }
}
