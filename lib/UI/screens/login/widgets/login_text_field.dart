import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {Key key,
      this.icon,
      this.focusNode,
      this.textEditingController,
      this.hintText,
      this.keyboardType})
      : super(key: key);
  final IconData icon;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType keyboardType;

//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

//  final FocusNode myFocusNode = FocusNode();
//  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
      child: TextField(
        focusNode: focusNode,
        controller: textEditingController,
        keyboardType: keyboardType,
        style: TextStyle(
            fontFamily: "WorkSansSemiBold",
            fontSize: 16.0,
            color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: icon == null
              ? null
              : Icon(
                  icon,
                  color: Colors.black,
                  size: 22.0,
                ),
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0),
        ),
      ),
    );
  }
}
