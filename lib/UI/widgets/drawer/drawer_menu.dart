import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/custom_user_account_drawer_header.dart';

import 'drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu(
      {Key key,
      this.userName: 'Shohidul Islam',
      this.email: "bksoftit@gmail.com"})
      : super(key: key);
  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          // Drawer header
          CustomUserAccountDrawerHeader(
            userName: userName,
            email: email,
          ),

          // Drawer body

          DrawerMenuItem(title: 'Home', icon: Icons.home),
          DrawerMenuItem(title: 'Login', icon: Icons.touch_app),
          DrawerMenuItem(title: 'Edit Profile', icon: Icons.perm_identity),
          DrawerMenuItem(
              title: 'Change Password', icon: Icons.enhanced_encryption),
          // DrawerMenuItem(title: 'Shop', icon: Icons.shopping_basket),
          Divider(),
          // menu
          // DrawerItem(
          //     title: 'Settings', icon: Icons.settings, iconColor: Colors.blue),
          DrawerMenuItem(
            title: 'Emergency Call 999 \nFor Pulice, Fire and Ambulance',
            icon: Icons.phone_forwarded,
            iconColor: Colors.purpleAccent,
          ),
          DrawerMenuItem(
              title: 'About Us', icon: Icons.help, iconColor: Colors.green),

          DrawerMenuItem(
            title: 'Contact Us',
            icon: Icons.phone,
            iconColor: Colors.blue,
          ),
          DrawerMenuItem(
              title: 'Setting',
              icon: Icons.settings_applications,
              iconColor: Colors.orangeAccent),
        ],
      ),
    );
  }
}
