//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:thikana_ki/UI/commonWidget/keyboard_input/phon_text_field.dart';
//import 'package:thikana_ki/UI/commonWidget/keyboard_input/user_name_text_field.dart';
//import 'package:thikana_ki/UI/widgets/button/app_button.dart';
//import 'package:thikana_ki/UI/widgets/login/password_text_field.dart';
//import 'package:thikana_ki/cores/utils/painter/bubble_indication_painter.dart';
//
//class LoginPage extends StatefulWidget {
//  @override
//  _LoginPageState createState() => _LoginPageState();
//}
//
//class _LoginPageState extends State<LoginPage> {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  String _email, _password;
//
//  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
//
//  // tab menu variable
//  PageController _pageController;
//  Color left = Colors.black;
//  Color right = Colors.white;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        padding: EdgeInsets.all(18.0),
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisSize: MainAxisSize.max,
//          children: <Widget>[
//            buildLogo(),
//            Padding(
//              padding: EdgeInsets.only(top: 20.0),
//              child: _buildMenuBar(context),
//            ),
//            Expanded(
//              flex: 2,
//              child: PageView(
//                controller: _pageController,
//                onPageChanged: (i) => changePageView(i),
//                children: <Widget>[
//                  ConstrainedBox(
//                    constraints: const BoxConstraints.expand(),
//                    child: Form(
//                      key: _formKey,
//                      child: Column(
//                        children: <Widget>[
//                          MyTextFormField(),
//                          PhoneTextField(),
//                          PasswordTextField(),
//                          PasswordTextField(
//                            hintText: 'confirm_password',
//                          ),
//                          _buildButton(),
//                        ],
//                      ),
//                    ),
//                  ),
////                  Container(
////                    child: Form(
////                      key: _formKey,
////                      child: Column(
////                        children: <Widget>[
////                          UserNameTextField(),
////                          PhoneTextField(),
////                          PasswordTextField(),
////                          PasswordTextField(
////                            hintText: 'confirm_password',
////                          ),
////                          _buildButton(),
////                        ],
////                      ),
////                    ),
////                  ),
//                ],
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void signIn() async {
//    if (_formKey.currentState.validate()) {
//      _formKey.currentState.save();
//
////      print("email: $_email, password: $_password");
//    }
//  }
//
//  // logo
//  Widget buildLogo() {
//    return Padding(
//      padding: EdgeInsets.only(top: 75.0, bottom: 25.0),
//      child: new Image(
////        width: 250.0,
////        height: 191.0,
//          fit: BoxFit.contain,
//          image: new AssetImage('assets/images/thikana_ki_bangla_logo.png')),
//    );
//  }
//
//  Widget _buildButton() {
//    return Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: AppButton(
//        text: 'Sign Up',
//        onPressed: () {},
//        disableTouchWhenLoading: true,
//      ),
//    );
//  }
//
//  Widget _buildMenuBar(BuildContext context) {
//    return Container(
//      width: 300.0,
//      height: 50.0,
//      decoration: BoxDecoration(
//        color: Color(0xFFC0C0C0),
//        borderRadius: BorderRadius.all(Radius.circular(25.0)),
//      ),
//      child: CustomPaint(
//        painter: TabIndicationPainter(pageController: _pageController),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            Expanded(
//              child: FlatButton(
//                splashColor: Colors.transparent,
//                highlightColor: Colors.transparent,
//                onPressed: _onUserSignUpButtonPress,
//                child: Text(
//                  "User",
//                  style: TextStyle(
//                      color: left,
//                      fontSize: 16.0,
//                      fontFamily: "WorkSansSemiBold"),
//                ),
//              ),
//            ),
//            //Container(height: 33.0, width: 1.0, color: Colors.white),
//            Expanded(
//              child: FlatButton(
//                splashColor: Colors.transparent,
//                highlightColor: Colors.transparent,
//                onPressed: _onBusinessSignUpButtonPress,
//                child: Text(
//                  "Business",
//                  style: TextStyle(
//                      color: right,
//                      fontSize: 16.0,
//                      fontFamily: "WorkSansSemiBold"),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  void _onUserSignUpButtonPress() {
//    _pageController.animateToPage(0,
//        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
//  }
//
//  void _onBusinessSignUpButtonPress() {
//    _pageController?.animateToPage(1,
//        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
//  }
//
//  changePageView(int i) {
//    {
//      if (i == 0) {
//        setState(() {
//          right = Colors.white;
//          left = Colors.black;
//        });
//      } else if (i == 1) {
//        setState(() {
//          right = Colors.black;
//          left = Colors.white;
//        });
//      }
//    }
//  }
//}
