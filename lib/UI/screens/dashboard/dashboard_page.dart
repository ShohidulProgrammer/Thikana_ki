import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/drawer/custom_user_account_drawer_header.dart';
import 'package:thikana_ki/UI/commonWidget/drawer/drawer_menu_item.dart';
import 'package:thikana_ki/cores/configs/router/router_path_constants.dart';

class DashBoardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          CustomUserAccountDrawerHeader(
            image:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRRhgSomq3OavrtWRyt5ey3d1kKFKtTmlRQK26af_WxC_ytTTIf&usqp=CAU',
          ),
          DrawerMenuItem(title: 'D-Card', icon: Icons.card_membership),
          DrawerMenuItem(title: 'QR-Code', icon: Icons.graphic_eq),
          DrawerMenuItem(
              title: 'Manage Shop', icon: Icons.settings_applications),
          DrawerMenuItem(title: 'Edit Profile', icon: Icons.perm_identity,route: signInPageRoute,),
          // DrawerMenuItem(title: 'Shop', icon: Icons.shopping_basket),
          Divider(),

          DrawerMenuItem(
            title: 'Contact Us',
            icon: Icons.phone,
            iconColor: Colors.blue,
            route: contactUsPageRoute,
          ),
        ],
      ),
    );
  }
}
