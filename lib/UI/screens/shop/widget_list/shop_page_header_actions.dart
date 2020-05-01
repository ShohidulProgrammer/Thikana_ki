import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/buttons/custom_floating_button.dart';

List<Widget> shopDetailPageEditorHeaderActions = <Widget>[
  CustomFloatingButton(
    iconData: Icons.add_a_photo,
    onPressed: () {},
  ),
  CustomFloatingButton(
    iconData: Icons.edit_location,
    onPressed: () {},
  ),
];

List<Widget> shopDetailPageUserHeaderActions({bool like}) {
  return [
    CustomFloatingButton(
      iconData: like ? Icons.favorite : Icons.favorite_border,
    ),
    CustomFloatingButton(
      iconData: Icons.share,
    ),
  ];
}
