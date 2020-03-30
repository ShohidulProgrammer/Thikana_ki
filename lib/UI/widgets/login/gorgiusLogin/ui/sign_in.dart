import 'package:flutter/material.dart';
import 'package:thikana_ki/UI/commonWidget/border_line.dart';
import 'package:thikana_ki/UI/widgets/login/gorgiusLogin/style/theme.dart' as Theme;

import 'login_text_field.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    FocusScope.of(context).requestFocus(new FocusNode());
    _scaffoldKey.currentState?.removeCurrentSnackBar();
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "WorkSansSemiBold"),
      ),
      backgroundColor: Colors.blue,
      duration: Duration(seconds: 3),
    ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topCenter,
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                elevation: 2.0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  width: 300.0,
                  height: 360.0,
                  child: Column(
                    children: <Widget>[
                      LoginTextField(hintText: 'Name',),
                      BorderLine(),
                      LoginTextField(hintText: 'Phone Number',),
                      BorderLine(),
                      LoginTextField(hintText: 'Password',),
                      BorderLine(),
                      LoginTextField(hintText: 'Confirm Password',),


//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
//                        child: TextField(
//                          focusNode: myFocusNodeEmailLogin,
//                          controller: loginEmailController,
//                          keyboardType: TextInputType.emailAddress,
//                          style: TextStyle(
//                              fontFamily: "WorkSansSemiBold",
//                              fontSize: 16.0,
//                              color: Colors.black),
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            icon: Icon(
//                              FontAwesomeIcons.envelope,
//                              color: Colors.black,
//                              size: 22.0,
//                            ),
//                            hintText: "Email Address",
//                            hintStyle: TextStyle(
//                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
//                          ),
//                        ),
//                      ),
//                      Container(
//                        width: 250.0,
//                        height: 1.0,
//                        color: Colors.grey[400],
//                      ),
//
//                      // Password
//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
//                        child: TextField(
//                          focusNode: myFocusNodePasswordLogin,
//                          controller: loginPasswordController,
//                          obscureText: _obscureTextLogin,
//                          style: TextStyle(
//                              fontFamily: "WorkSansSemiBold",
//                              fontSize: 16.0,
//                              color: Colors.black),
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            icon: Icon(
//                              FontAwesomeIcons.lock,
//                              size: 22.0,
//                              color: Colors.black,
//                            ),
//                            hintText: "Password",
//                            hintStyle: TextStyle(
//                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
//                            suffixIcon: GestureDetector(
//                              onTap: _toggleLogin,
//                              child: Icon(
//                                _obscureTextLogin
//                                    ? FontAwesomeIcons.eye
//                                    : FontAwesomeIcons.eyeSlash,
//                                size: 15.0,
//                                color: Colors.black,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
              ),
              // login button
              Container(
                margin: EdgeInsets.only(top: 340.0),
//                decoration: new BoxDecoration(
//                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                    color: Colors.teal
////                  boxShadow: <BoxShadow>[
////                    BoxShadow(
////                      color: Theme.Colors.loginGradientStart,
////                      offset: Offset(1.0, 6.0),
////                      blurRadius: 20.0,
////                    ),
////                    BoxShadow(
////                      color: Theme.Colors.loginGradientEnd,
////                      offset: Offset(1.0, 6.0),
////                      blurRadius: 20.0,
////                    ),
////                  ],
////                  gradient: new LinearGradient(
////                      colors: [
////                        Theme.Colors.loginGradientEnd,
////                        Theme.Colors.loginGradientStart
////                      ],
////                      begin: const FractionalOffset(0.2, 0.2),
////                      end: const FractionalOffset(1.0, 1.0),
////                      stops: [0.0, 1.0],
////                      tileMode: TileMode.clamp),
//                    ),
                child: MaterialButton(
                    color: Colors.teal[800],
                    highlightColor: Colors.transparent,
                    splashColor: Theme.Colors.loginGradientEnd,
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontFamily: "WorkSansBold"),
                      ),
                    ),
                    onPressed: () => showInSnackBar("Login button pressed")),
              ),
            ],
          ),
//          //Forgot Password
//          Padding(
//            padding: EdgeInsets.only(top: 10.0),
//            child: FlatButton(
//                onPressed: () {},
//                child: Text(
//                  "Forgot Password?",
//                  style: TextStyle(
//                      decoration: TextDecoration.underline,
//                      color: Colors.white,
//                      fontSize: 16.0,
//                      fontFamily: "WorkSansMedium"),
//                )),
//          ),
//          // or
//          Padding(
//            padding: EdgeInsets.only(top: 10.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Container(
//                  decoration: BoxDecoration(
//                    gradient: new LinearGradient(
//                        colors: [
//                          Colors.white10,
//                          Colors.white,
//                        ],
//                        begin: const FractionalOffset(0.0, 0.0),
//                        end: const FractionalOffset(1.0, 1.0),
//                        stops: [0.0, 1.0],
//                        tileMode: TileMode.clamp),
//                  ),
//                  width: 100.0,
//                  height: 1.0,
//                ),
//                Padding(
//                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
//                  child: Text(
//                    "Or",
//                    style: TextStyle(
//                        color: Colors.white,
//                        fontSize: 16.0,
//                        fontFamily: "WorkSansMedium"),
//                  ),
//                ),
//                Container(
//                  decoration: BoxDecoration(
//                    gradient: new LinearGradient(
//                        colors: [
//                          Colors.white,
//                          Colors.white10,
//                        ],
//                        begin: const FractionalOffset(0.0, 0.0),
//                        end: const FractionalOffset(1.0, 1.0),
//                        stops: [0.0, 1.0],
//                        tileMode: TileMode.clamp),
//                  ),
//                  width: 100.0,
//                  height: 1.0,
//                ),
//              ],
//            ),
//          ),
//          // facebook button
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Padding(
//                padding: EdgeInsets.only(top: 10.0, right: 40.0),
//                child: GestureDetector(
//                  onTap: () => showInSnackBar("Facebook button pressed"),
//                  child: Container(
//                    padding: const EdgeInsets.all(15.0),
//                    decoration: new BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                    child: new Icon(
//                      FontAwesomeIcons.facebookF,
//                      color: Color(0xFF0084ff),
//                    ),
//                  ),
//                ),
//              ),
//              Padding(
//                padding: EdgeInsets.only(top: 10.0),
//                child: GestureDetector(
//                  onTap: () => showInSnackBar("Google button pressed"),
//                  child: Container(
//                    padding: const EdgeInsets.all(15.0),
//                    decoration: new BoxDecoration(
//                      shape: BoxShape.circle,
//                      color: Colors.white,
//                    ),
//                    child: new Icon(
//                      FontAwesomeIcons.google,
//                      color: Color(0xFF0084ff),
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
        ],
      ),
    );
  }

}
