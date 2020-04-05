import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget title;
  final Widget leading;
  final Widget subTitle;
  final Widget trailing;
  final VoidCallback onTap;

  const CustomListTile(
      {this.title, this.subTitle, this.leading, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subTitle,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
