import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AScrollBar extends StatelessWidget {
  final Widget child;
  final ScrollController controller;

  const AScrollBar({Key? key, required this.child, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => child,
      tablet: (context) => child,
      desktop: (context) => Scrollbar(
        child: child,
        controller: controller,
        thumbVisibility: true,
      ),
    );
  }
}
