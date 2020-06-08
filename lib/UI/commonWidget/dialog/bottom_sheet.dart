import 'package:flutter/material.dart';

void customBottomSheet({BuildContext context, Widget child}) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return child;
      });
}
