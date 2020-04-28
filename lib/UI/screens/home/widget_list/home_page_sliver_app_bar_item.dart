import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:thikana_ki/UI/commonWidget/google_map/google_map.dart';
import 'package:thikana_ki/UI/commonWidget/keyboard_input/search_input_field.dart';
import 'package:thikana_ki/UI/commonWidget/painter/border_line.dart';
import 'package:thikana_ki/UI/screens/home/widgets/category_icon.dart';
import 'package:thikana_ki/UI/screens/home/widgets/thana.dart';

List<Widget> homePageSliverHeaderList = [
  MyGoogleMap(heightPart: 3),
  SearchInputField(),
  ThanaName(),
  EmergencyCategoryIcons(),
  BorderLine(),
//  CustomTabBarHeader(tabHeaders: homePageTabHeader),
];
