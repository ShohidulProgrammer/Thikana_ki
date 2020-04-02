import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/drawer/custom_user_account_drawer_header.dart';
import 'package:thikana_ki/UI/commonWidget/drawer/drawer_menu_item.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomUserAccountDrawerHeader(
            image:
                'https://cdn2.vectorstock.com/i/1000x1000/66/56/software-developer-vector-12486656.jpg',
          ),
          DrawerMenuItem(title: 'D-Card', icon: Icons.card_membership),
          DrawerMenuItem(title: 'QR-Code', icon: Icons.graphic_eq),
          DrawerMenuItem(
              title: 'Manage Shop', icon: Icons.settings_applications),
          DrawerMenuItem(title: 'Edit Profile', icon: Icons.perm_identity),
          DrawerMenuItem(
              title: 'Change Password', icon: Icons.enhanced_encryption),
          // DrawerMenuItem(title: 'Shop', icon: Icons.shopping_basket),
          Divider(),

          DrawerMenuItem(
            title: 'Contact Us',
            icon: Icons.phone,
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
