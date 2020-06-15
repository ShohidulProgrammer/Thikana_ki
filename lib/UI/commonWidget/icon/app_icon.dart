import 'package:flutter/material.dart';

class AppIcon extends Icon {
  const AppIcon(
      {@required IconData icon,
      double size: 22.0,
      Color color: Colors.black,
      String semanticLabel,
      TextDirection textDirection,
      Key key})
      : assert(icon != null),
        super(
          icon,
          size: size,
          color: color,
          semanticLabel: semanticLabel,
          textDirection: textDirection,
          key: key,
        );
}
