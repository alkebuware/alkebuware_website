import 'package:flutter/material.dart';

class AFab extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color backgroundColor;

  const AFab(
      {Key? key,
      required this.onPressed,
      required this.child,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shadowColor: backgroundColor,
      shape: CircleBorder(),
      elevation: 8,
      child: Container(
        height: 56,
        width: 56,
        child: InkWell(
          child: child,
          splashColor: Colors.white38,
          highlightColor: Colors.white38,
          borderRadius: BorderRadius.circular(1000),
          onTap: onPressed,
        ),
      ),
    );
  }
}
