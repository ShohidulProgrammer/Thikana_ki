import 'package:flutter/material.dart';
import 'package:thikana_ki/cores/configs/router/go_next_page.dart';


class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final String route;

  DrawerMenuItem({this.title, this.icon, this.iconColor, this.route});

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => openRoutePage(context: context, route: route ?? '/$title'),
//      onTap: () => Navigator.of(context).pushNamed('/$title'),
      child: ListTile(
        title: Text(title),
        leading: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
