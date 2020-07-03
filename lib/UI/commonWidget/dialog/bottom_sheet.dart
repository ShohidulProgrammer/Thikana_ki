import 'package:flutter/material.dart';

void customBottomSheet({BuildContext context, Widget child}) {
  showModalBottomSheet(
      elevation: 3,
      barrierColor: Colors.black.withOpacity(0.3),
      context: context,
      builder: (_) {
        return Container(
          color: Colors.black87.withOpacity(0.7),
          // color: Color(0xFF596e7f),
          // color: Color(0xFF737373),
          // height: 180,
          child: Container(
            child: child,
            decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              // color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        );
      });
}
