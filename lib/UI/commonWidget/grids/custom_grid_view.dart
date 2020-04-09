import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/cards/image_with_title_card.dart';
import 'package:thikana_ki/cores/models/screen_models/icon_with_title_list.dart';

class ImageWithTitleCardGridView extends StatelessWidget {
  const ImageWithTitleCardGridView(
      {this.myListView,
      this.backgroundColor,
      this.crossAxisCount: 3,
      this.cardHeightPart: 6,
      this.cardWidthPart: 3.5});

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

    return GridView.count(
      padding: EdgeInsets.only(
        top: 2.0,
      ), // bottom: screenSize.height  /10
      crossAxisCount: crossAxisCount,
      childAspectRatio: (itemWidth / itemHeight),
      children: List.generate(iconWithTitleList.length, (int index) {
        return Container(
          color: backgroundColor ?? Colors.blueGrey[50],
          child:
              ImageWithTitleCard(iconWithTitleModel: iconWithTitleList[index]),
        );
      }),
    );
  }
}
