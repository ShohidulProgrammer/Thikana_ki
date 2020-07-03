// import 'package:flutter/material.dart';
// import 'package:thikana_ki/UI/screens/login/sign_in_page.dart';

// import 'admin_panel.dart';

// class RootPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final BaseAuth auth = AuthProvider.of(context).auth;
//     return StreamBuilder<String>(
//         stream: auth.onAuthStateChanged,
//         builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             final bool isLoggedIn = snapshot.hasData;
//             return isLoggedIn ? AdminPanel() : SignInPage();
//           }
//           return _buildWaitingScreen();
//         });
//   }

//   Widget _buildWaitingScreen() {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
