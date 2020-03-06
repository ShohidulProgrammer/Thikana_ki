import 'package:flutter/material.dart';

class AnimatedLogo extends StatefulWidget {
  AnimatedLogo({Key key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double screen_height = MediaQuery.of(context).size.height;
    final double screen_width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Align(
        alignment: FractionalOffset.center,
        child: Image(
          height: animation.value,
          width: animation.value,
          image: AssetImage('assets/images/thikana_ki_logo.png'),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
