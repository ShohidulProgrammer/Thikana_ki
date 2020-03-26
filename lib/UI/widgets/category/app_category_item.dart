import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../cores/models/model_category.dart';

class AppCategoryItem extends StatelessWidget {
  AppCategoryItem({
    Key key,
    this.item,
    this.onPressed,
  }) : super(key: key);


  final CategoryModel item;
  final ValueChanged<CategoryModel> onPressed;

  @override
  Widget build(BuildContext context) {
    if (item == null) {
      return Shimmer.fromColors(
        baseColor: Theme.of(context).hoverColor,
        highlightColor: Theme.of(context).highlightColor,
        enabled: true,
        child: Container(
          height: 120,
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
    }
    return InkWell(
        onTap: () => onPressed(item),
        child: Container(
          padding: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: item.color,
                ),
                child: Icon(
                  item.icon,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      item.title,
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '${item.count} location',
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
