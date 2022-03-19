import 'package:flutter/material.dart';

class FlutterPopupMenuIcon extends StatelessWidget {
  final Widget child;

  ///This widget require a global key to calculate the position of widget on screen and show menu accordingly.
  @override
  final GlobalKey key;

  const FlutterPopupMenuIcon({required this.key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
