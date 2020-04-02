import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget title;
  final Widget subTitle;
  final Widget trailing;
  final VoidCallback onTap;

  const CustomListTile({this.title, this.subTitle, this.trailing, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: title,
      subtitle: subTitle,
      trailing: trailing,
      onTap: onTap,
    );
  }
}
