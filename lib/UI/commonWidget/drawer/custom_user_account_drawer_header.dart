import 'package:flutter/material.dart';

class CustomUserAccountDrawerHeader extends StatefulWidget {
  final String userName;
  final String phone;
  final String email;
  final String image;

  const CustomUserAccountDrawerHeader(
      {this.userName: 'Shohidul Islam',
      this.phone: "01536218968",
      this.email: '',
      this.image:
          'https://icons.iconarchive.com/icons/graphicloads/flat-finance/256/person-icon.png'});

  @override
  _CustomUserAccountDrawerHeaderState createState() =>
      _CustomUserAccountDrawerHeaderState();
}

class _CustomUserAccountDrawerHeaderState
    extends State<CustomUserAccountDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return new UserAccountsDrawerHeader(
      accountName: Text(widget.userName),
      accountEmail: Text('${widget.phone}\n${widget.email}'),
      currentAccountPicture: GestureDetector(
          onTap: () {
            print('profile pic taped!');
          },
          child: new CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 30.0,
            backgroundImage: NetworkImage(widget.image),
//              NetworkImage("${snapshot.data.hitsList[index].previewUrl}")
          )),
      decoration: new BoxDecoration(color: Colors.pink),
    );
  }
}
