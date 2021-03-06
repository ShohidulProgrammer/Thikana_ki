import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/cards/image_with_title_card.dart';
import 'package:thikana_ki/UI/screens/home/widgets/category_card.dart';
import 'package:thikana_ki/cores/models/screen_models/icon_with_title_list.dart';

class ImageWithTitleCardGridView extends StatelessWidget {
  const ImageWithTitleCardGridView({
    this.myListView,
    this.backgroundColor,
    this.crossAxisCount: 3,
    this.cardHeightPart: 6,
    this.cardWidthPart: 3.5,
  });

  final List<dynamic> myListView;
  final Color backgroundColor;
  final int crossAxisCount;
  final double cardHeightPart;
  final double cardWidthPart;

//  final double itemHeight = 200;
//  final double itemWidth = 150;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    final double itemHeight = screenSize.height / cardHeightPart;
    final double itemWidth = screenSize.width / cardWidthPart;

//    return Wrap(children: iconWithTitleList.map((item) {
//      return AspectRatio(
//        aspectRatio: 3/2,
//        child: Container(
//          color: backgroundColor ?? Colors.blueGrey[50],
//          child: ImageWithTitleCard(iconWithTitleModel: item),
//        ),
//      );
//    }).toList(),);

    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
        //
        // bottom: screenSize.height  /10
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: (itemWidth / itemHeight),
        ),
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 2.0),
            color: backgroundColor ?? Colors.blue[50],
            child:
                CategoryCard(context: context, category: categoryList[index]),
          );
        });
  }
}
