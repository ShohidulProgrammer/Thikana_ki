import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/cards/image_with_title_card.dart';
import 'package:thikana_ki/model/icon_with_title_model.dart';

import '../utils/add_category_dialogue.dart';

class MenuCard extends ImageWithTitleCard {
  MenuCard({
    @required BuildContext context,
    @required IconWithTitleModel menuModel,
  })  : assert(context != null, menuModel != null),
        super(
          title: menuModel.title,
          icon: menuModel.icon,
          backgroundColor: menuModel.backgroundColor,
          titleColor: Colors.white,
          iconColor: Colors.white,
          onTap: () => addCategoryDialogue(
            context: context,
            alertTitle: menuModel.title,
          ),
        );
}
