import 'package:alkebuware_website/main.dart';
import 'package:flutter/widgets.dart';

typedef RouteNameBuilder = Widget Function(
    BuildContext context, String routeName);

class CurrentRouteBuilder extends StatefulWidget {
  final RouteNameBuilder builder;

  const CurrentRouteBuilder({Key key, @required this.builder})
      : super(key: key);

  @override
  _CurrentRouteBuilderState createState() => _CurrentRouteBuilderState();
}

class _CurrentRouteBuilderState extends State<CurrentRouteBuilder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
        stream: observer.currentRouteStream,
        builder: (context, snapshot) => widget.builder(context, snapshot.data));
  }
}
