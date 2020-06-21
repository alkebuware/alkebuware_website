import 'package:draggable_scrollbar_sliver/draggable_scrollbar_sliver.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AScrollBar extends StatelessWidget {
  final Widget child;
  final ScrollController controller;

  const AScrollBar({Key key, @required this.child, @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: child,
      tablet: child,
      desktop: DraggableScrollbar.rrect(
        child: child,
        controller: controller,
        alwaysVisibleScrollThumb: true,
      ),
    );
  }
}
