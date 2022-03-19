import 'package:flutter/material.dart';

class FlutterPopupMenuItem extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final bool closeOnItemClick;

  const FlutterPopupMenuItem(
      {required this.child, Key? key, this.onTap, this.closeOnItemClick = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (closeOnItemClick) {
          Navigator.of(context).pop();
        }
        if (onTap != null) {
          onTap!();
        }
      },
      child: child,
    );
  }
}