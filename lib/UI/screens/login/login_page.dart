import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thikana_ki/UI/commonWidget/painter/border_line.dart';
import 'package:thikana_ki/UI/screens/login/widgets/business_sign_up.dart';
import 'package:thikana_ki/UI/screens/login/widgets/gorgiusLogin/style/theme.dart'
    as Theme;
import 'package:thikana_ki/UI/screens/login/widgets/gorgiusLogin/utils/bubble_indication_painter.dart';
import 'package:thikana_ki/UI/screens/login/widgets/user_sign_up.dart';

import 'widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController loginEmailController = new TextEditingController();
  TextEditingController loginPasswordController = new TextEditingController();

  bool _obscureTextLogin = true;
  bool _obscureTextSignup = true;
  bool _obscureTextSignupConfirm = true;

  TextEditingController signupEmailController = new TextEditingController();
  TextEditingController signupNameController = new TextEditingController();
  TextEditingController signupPasswordController = new TextEditingController();
  TextEditingController signupConfirmPasswordController =
      new TextEditingController();

  PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowGlow();
        },
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height >= 775.0
                ? MediaQuery.of(context).size.height + 100
                : 775.0 + 100,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // logo
                _buildLogo(),
                _buildMenuBar(context),
                Expanded(
                  flex: 2,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },

                    // page view body
                    children: <Widget>[
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: UserSignUp(),
                      ),
                      new ConstrainedBox(
                        constraints: const BoxConstraints.expand(),
                        child: BusinessSignUp(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();
    myFocusNodeName.dispose();
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _pageController = PageController();
  }

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

  // menu bar
  Widget _buildMenuBar(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Container(
      width: width * 0.833, //300.0,
      height: height * 0.075, //50.0,
      decoration: BoxDecoration(
//        color: Colors.blueGrey,
        color: Colors.teal,
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: TabIndicationPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "User",
                  style: TextStyle(
                      color: left,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: FlatButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Business",
                  style: TextStyle(
                      color: right,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  // sign in card
//  Widget _buildSignIn(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.only(top: 23.0),
//      child: Column(
//        children: <Widget>[
//          Stack(
//            alignment: Alignment.topCenter,
//            overflow: Overflow.visible,
//            children: <Widget>[
//              Card(
//                elevation: 2.0,
//                color: Colors.white,
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(8.0),
//                ),
//                child: Container(
//                  width: 300.0,
//                  height: 360.0,
//                  child: Column(
//                    children: <Widget>[
//                      LoginTextField(
//                        hintText: 'Name',
//                      ),
//                      BorderLine(),
//                      LoginTextField(
//                        hintText: 'Phone Number',
//                      ),
//                      BorderLine(),
//                      LoginTextField(
//                        hintText: 'Password',
//                      ),
//                      BorderLine(),
//                      LoginTextField(
//                        hintText: 'Confirm Password',
//                      ),
//
////                      Padding(
////                        padding: EdgeInsets.only(
////                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
////                        child: TextField(
////                          focusNode: myFocusNodeEmailLogin,
////                          controller: loginEmailController,
////                          keyboardType: TextInputType.emailAddress,
////                          style: TextStyle(
////                              fontFamily: "WorkSansSemiBold",
////                              fontSize: 16.0,
////                              color: Colors.black),
////                          decoration: InputDecoration(
////                            border: InputBorder.none,
////                            icon: Icon(
////                              FontAwesomeIcons.envelope,
////                              color: Colors.black,
////                              size: 22.0,
////                            ),
////                            hintText: "Email Address",
////                            hintStyle: TextStyle(
////                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
////                          ),
////                        ),
////                      ),
////                      Container(
////                        width: 250.0,
////                        height: 1.0,
////                        color: Colors.grey[400],
////                      ),
////
////                      // Password
////                      Padding(
////                        padding: EdgeInsets.only(
////                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
////                        child: TextField(
////                          focusNode: myFocusNodePasswordLogin,
////                          controller: loginPasswordController,
////                          obscureText: _obscureTextLogin,
////                          style: TextStyle(
////                              fontFamily: "WorkSansSemiBold",
////                              fontSize: 16.0,
////                              color: Colors.black),
////                          decoration: InputDecoration(
////                            border: InputBorder.none,
////                            icon: Icon(
////                              FontAwesomeIcons.lock,
////                              size: 22.0,
////                              color: Colors.black,
////                            ),
////                            hintText: "Password",
////                            hintStyle: TextStyle(
////                                fontFamily: "WorkSansSemiBold", fontSize: 17.0),
////                            suffixIcon: GestureDetector(
////                              onTap: _toggleLogin,
////                              child: Icon(
////                                _obscureTextLogin
////                                    ? FontAwesomeIcons.eye
////                                    : FontAwesomeIcons.eyeSlash,
////                                size: 15.0,
////                                color: Colors.black,
////                              ),
////                            ),
////                          ),
////                        ),
////                      ),
//                    ],
//                  ),
//                ),
//              ),
//              // login button
//              Container(
//                margin: EdgeInsets.only(top: 340.0),
////                decoration: new BoxDecoration(
////                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
////                    color: Colors.teal
//////                  boxShadow: <BoxShadow>[
//////                    BoxShadow(
//////                      color: Theme.Colors.loginGradientStart,
//////                      offset: Offset(1.0, 6.0),
//////                      blurRadius: 20.0,
//////                    ),
//////                    BoxShadow(
//////                      color: Theme.Colors.loginGradientEnd,
//////                      offset: Offset(1.0, 6.0),
//////                      blurRadius: 20.0,
//////                    ),
//////                  ],
//////                  gradient: new LinearGradient(
//////                      colors: [
//////                        Theme.Colors.loginGradientEnd,
//////                        Theme.Colors.loginGradientStart
//////                      ],
//////                      begin: const FractionalOffset(0.2, 0.2),
//////                      end: const FractionalOffset(1.0, 1.0),
//////                      stops: [0.0, 1.0],
//////                      tileMode: TileMode.clamp),
////                    ),
//                child: MaterialButton(
//                    color: Colors.teal[800],
//                    highlightColor: Colors.transparent,
//                    splashColor: Theme.Colors.loginGradientEnd,
//                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                    child: Padding(
//                      padding: const EdgeInsets.symmetric(
//                          vertical: 10.0, horizontal: 42.0),
//                      child: Text(
//                        "LOGIN",
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 25.0,
//                            fontFamily: "WorkSansBold"),
//                      ),
//                    ),
//                    onPressed: () => showInSnackBar("Login button pressed")),
//              ),
//            ],
//          ),
////          //Forgot Password
////          Padding(
////            padding: EdgeInsets.only(top: 10.0),
////            child: FlatButton(
////                onPressed: () {},
////                child: Text(
////                  "Forgot Password?",
////                  style: TextStyle(
////                      decoration: TextDecoration.underline,
////                      color: Colors.white,
////                      fontSize: 16.0,
////                      fontFamily: "WorkSansMedium"),
////                )),
////          ),
////          // or
////          Padding(
////            padding: EdgeInsets.only(top: 10.0),
////            child: Row(
////              mainAxisAlignment: MainAxisAlignment.center,
////              children: <Widget>[
////                Container(
////                  decoration: BoxDecoration(
////                    gradient: new LinearGradient(
////                        colors: [
////                          Colors.white10,
////                          Colors.white,
////                        ],
////                        begin: const FractionalOffset(0.0, 0.0),
////                        end: const FractionalOffset(1.0, 1.0),
////                        stops: [0.0, 1.0],
////                        tileMode: TileMode.clamp),
////                  ),
////                  width: 100.0,
////                  height: 1.0,
////                ),
////                Padding(
////                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
////                  child: Text(
////                    "Or",
////                    style: TextStyle(
////                        color: Colors.white,
////                        fontSize: 16.0,
////                        fontFamily: "WorkSansMedium"),
////                  ),
////                ),
////                Container(
////                  decoration: BoxDecoration(
////                    gradient: new LinearGradient(
////                        colors: [
////                          Colors.white,
////                          Colors.white10,
////                        ],
////                        begin: const FractionalOffset(0.0, 0.0),
////                        end: const FractionalOffset(1.0, 1.0),
////                        stops: [0.0, 1.0],
////                        tileMode: TileMode.clamp),
////                  ),
////                  width: 100.0,
////                  height: 1.0,
////                ),
////              ],
////            ),
////          ),
////          // facebook button
////          Row(
////            mainAxisAlignment: MainAxisAlignment.center,
////            children: <Widget>[
////              Padding(
////                padding: EdgeInsets.only(top: 10.0, right: 40.0),
////                child: GestureDetector(
////                  onTap: () => showInSnackBar("Facebook button pressed"),
////                  child: Container(
////                    padding: const EdgeInsets.all(15.0),
////                    decoration: new BoxDecoration(
////                      shape: BoxShape.circle,
////                      color: Colors.white,
////                    ),
////                    child: new Icon(
////                      FontAwesomeIcons.facebookF,
////                      color: Color(0xFF0084ff),
////                    ),
////                  ),
////                ),
////              ),
////              Padding(
////                padding: EdgeInsets.only(top: 10.0),
////                child: GestureDetector(
////                  onTap: () => showInSnackBar("Google button pressed"),
////                  child: Container(
////                    padding: const EdgeInsets.all(15.0),
////                    decoration: new BoxDecoration(
////                      shape: BoxShape.circle,
////                      color: Colors.white,
////                    ),
////                    child: new Icon(
////                      FontAwesomeIcons.google,
////                      color: Color(0xFF0084ff),
////                    ),
////                  ),
////                ),
////              ),
////            ],
////          ),
//        ],
//      ),
//    );
//  }

//  // signup card
//  Widget _buildSignUp(BuildContext context) {
//    return Container(
//      padding: EdgeInsets.only(top: 23.0),
//      child: Column(
//        children: <Widget>[
//          Stack(
//            alignment: Alignment.topCenter,
//            overflow: Overflow.visible,
//            children: <Widget>[
//              Card(
//                elevation: 2.0,
//                color: Colors.white,
//                shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(8.0),
//                ),
//                child: Container(
//                  width: 300.0,
//                  height: 360.0,
//                  child: Column(
//                    children: <Widget>[
//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
//                        child: TextField(
//                          focusNode: myFocusNodeName,
//                          controller: signupNameController,
//                          keyboardType: TextInputType.text,
//                          textCapitalization: TextCapitalization.words,
//                          style: TextStyle(
//                              fontFamily: "WorkSansSemiBold",
//                              fontSize: 16.0,
//                              color: Colors.black),
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            icon: Icon(
//                              FontAwesomeIcons.user,
//                              color: Colors.black,
//                            ),
//                            hintText: "Name",
//                            hintStyle: TextStyle(
//                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
//                          ),
//                        ),
//                      ),
//                      Container(
//                        width: 250.0,
//                        height: 1.0,
//                        color: Colors.grey[400],
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
//                        child: TextField(
//                          focusNode: myFocusNodeEmail,
//                          controller: signupEmailController,
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
//                            ),
//                            hintText: "Email Address",
//                            hintStyle: TextStyle(
//                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
//                          ),
//                        ),
//                      ),
//                      Container(
//                        width: 250.0,
//                        height: 1.0,
//                        color: Colors.grey[400],
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
//                        child: TextField(
//                          focusNode: myFocusNodePassword,
//                          controller: signupPasswordController,
//                          obscureText: _obscureTextSignup,
//                          style: TextStyle(
//                              fontFamily: "WorkSansSemiBold",
//                              fontSize: 16.0,
//                              color: Colors.black),
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            icon: Icon(
//                              FontAwesomeIcons.lock,
//                              color: Colors.black,
//                            ),
//                            hintText: "Password",
//                            hintStyle: TextStyle(
//                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
//                            suffixIcon: GestureDetector(
//                              onTap: _toggleSignup,
//                              child: Icon(
//                                _obscureTextSignup
//                                    ? FontAwesomeIcons.eye
//                                    : FontAwesomeIcons.eyeSlash,
//                                size: 15.0,
//                                color: Colors.black,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                      Container(
//                        width: 250.0,
//                        height: 1.0,
//                        color: Colors.grey[400],
//                      ),
//                      Padding(
//                        padding: EdgeInsets.only(
//                            top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
//                        child: TextField(
//                          controller: signupConfirmPasswordController,
//                          obscureText: _obscureTextSignupConfirm,
//                          style: TextStyle(
//                              fontFamily: "WorkSansSemiBold",
//                              fontSize: 16.0,
//                              color: Colors.black),
//                          decoration: InputDecoration(
//                            border: InputBorder.none,
//                            icon: Icon(
//                              FontAwesomeIcons.lock,
//                              color: Colors.black,
//                            ),
//                            hintText: "Confirmation",
//                            hintStyle: TextStyle(
//                                fontFamily: "WorkSansSemiBold", fontSize: 16.0),
//                            suffixIcon: GestureDetector(
//                              onTap: _toggleSignupConfirm,
//                              child: Icon(
//                                _obscureTextSignupConfirm
//                                    ? FontAwesomeIcons.eye
//                                    : FontAwesomeIcons.eyeSlash,
//                                size: 15.0,
//                                color: Colors.black,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//              Container(
//                margin: EdgeInsets.only(top: 340.0),
//                decoration: new BoxDecoration(
//                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                  boxShadow: <BoxShadow>[
//                    BoxShadow(
//                      color: Theme.Colors.loginGradientStart,
//                      offset: Offset(1.0, 6.0),
//                      blurRadius: 20.0,
//                    ),
//                    BoxShadow(
//                      color: Theme.Colors.loginGradientEnd,
//                      offset: Offset(1.0, 6.0),
//                      blurRadius: 20.0,
//                    ),
//                  ],
//                  gradient: new LinearGradient(
//                      colors: [
//                        Theme.Colors.loginGradientEnd,
//                        Theme.Colors.loginGradientStart
//                      ],
//                      begin: const FractionalOffset(0.2, 0.2),
//                      end: const FractionalOffset(1.0, 1.0),
//                      stops: [0.0, 1.0],
//                      tileMode: TileMode.clamp),
//                ),
//                child: MaterialButton(
//                    highlightColor: Colors.transparent,
//                    splashColor: Theme.Colors.loginGradientEnd,
//                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
//                    child: Padding(
//                      padding: const EdgeInsets.symmetric(
//                          vertical: 10.0, horizontal: 42.0),
//                      child: Text(
//                        "SIGN UP",
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontSize: 25.0,
//                            fontFamily: "WorkSansBold"),
//                      ),
//                    ),
//                    onPressed: () => showInSnackBar("SignUp button pressed")),
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  void _toggleSignupConfirm() {
    setState(() {
      _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
    });
  }

  Widget _buildLogo() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: new Image(
//          width: 250.0,
//          height: 150.0,
//          width: MediaQuery.of(context).size.width / 1.2,
          fit: BoxFit.contain,
          image: new AssetImage('assets/images/thikana_ki_adjust_logo.png')),
    );
  }
}
