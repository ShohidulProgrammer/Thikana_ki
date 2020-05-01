import 'package:flutter/material.dart';

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;

  const CircularIconButton({@required this.icon,this.backgroundColor , this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        maxRadius: 54.0,
        backgroundColor: backgroundColor ?? Colors.blueGrey[600],
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
