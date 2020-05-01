import 'package:flutter/material.dart';

class CustomSeparatorListFactory extends StatelessWidget {
  final List<Widget> listItem;
  final Widget child;

  const CustomSeparatorListFactory({this.listItem, this.child});

  @override
  Widget build(BuildContext context) {
//    if (listItem == null) {
//      return ListView.builder(
//        padding: EdgeInsets.only(
//          left: 20,
//          right: 20,
//        ),
//        itemCount: List.generate(8, (index) => index).length,
//        itemBuilder: (context, index) {
//          return Padding(
//            padding: EdgeInsets.only(bottom: 15),
//            child: AppCategoryItem(),
//          );
//        },
//      );
//    }
//
//    if (listItem.isEmpty) {
//      return Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Icon(Icons.sentiment_satisfied),
//            Padding(
//              padding: EdgeInsets.all(3.0),
//              child: Text(
////                  widget.popularTitle,
//                Translate.of(context).translate('item_not_found'),
//                style: Theme.of(context).textTheme.body2,
//              ),
//            ),
//          ],
//        ),
//      );
//    }

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
        top: 2.0,
      ),
      shrinkWrap: true,

      separatorBuilder: (context, index) => Divider(
        indent: 20,
        endIndent: 15,
//        color: Colors.black,
      ),
      itemCount: 60,
      itemBuilder: (context, index) {
//        final item = listItem[index] ;
        return Container(
          child: child,
        );
      },
    );
  }
}
