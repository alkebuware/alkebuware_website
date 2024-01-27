import 'package:alkebuware_website/extensions/build_context.dart';
import 'package:alkebuware_website/main.dart';
import 'package:flutter/widgets.dart';

typedef RouteNameBuilder = Widget Function(
    BuildContext context, String routeName);

class CurrentRouteBuilder extends StatelessWidget {
  final RouteNameBuilder builder;

  const CurrentRouteBuilder({Key? key, required this.builder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: router.routeInformationProvider,
        builder: (context, _) => builder(context, context.currentRoute));
  }
}
