import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/cards/image_with_title_card.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';
import 'package:thikana_ki/model/icon_with_title_model.dart';

class CategoryCard extends ImageWithTitleCard {
  CategoryCard({
    @required BuildContext context,
    @required IconWithTitleModel category,
  })  : assert(context != null, category != null),
        super(
          title: category.title,
          icon: category.icon,
          titleColor: Colors.blueGrey,
          iconColor: category.iconColor,
          onTap: () => Navigator.pushNamed(
              context, listProductPageRoute, // category.route,
              arguments: category.title ?? ''),
        );
}
