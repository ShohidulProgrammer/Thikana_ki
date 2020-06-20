import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  final Widget child;

  const NavigationPage({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return child;
  }

//   //Use the navigator like you usually do with .of(context) method
//   _openDetailsPage(BuildContext context) =>
//       Navigator.of(context).push(MaterialPageRoute(
//           builder: (context) => DetailsPage(
//             child: EmergencyCategoryListFactory(),
//           )));

// //  _openDetailsPage(BuildContext context) => mainNavigatorKey.currentState.push(MaterialPageRoute(builder: (context) => DetailsPage(title)));

}

class DetailsPage extends StatelessWidget {
  final Widget child;

  const DetailsPage({@required this.child}) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
