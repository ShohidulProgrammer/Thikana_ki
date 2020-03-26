
import 'package:flutter/material.dart';
import '../../configs/router/router_path_constants.dart';

///On select category
void onTapService(item, BuildContext context) {
  switch (item.route) {
    case 'category':
      Navigator.pushNamed(context, categoryPageRoute);
      break;
    case 'list':
      Navigator.pushNamed(context, listProductPageRoute, arguments: item.title);
      break;
    default:
      break;
  }
}

