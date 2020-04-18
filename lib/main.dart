import 'package:alkebuware_website/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  GlobalKey<NavigatorState> _navigatorKey;
  String currentRoute;

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  @override
  void initState() {
    super.initState();
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Alkebuware - Let\'s Build Something Great',
      builder: (BuildContext context, Widget widget) {
        return Scaffold(
          appBar: AAppBar(navigatorKey: _navigatorKey),
          body: Navigator(
            key: _navigatorKey,
            onGenerateRoute: (settings) {
              print("navigate to: ${settings.name}");
              currentRoute = settings.name;
              return MaterialPageRoute(builder: routes[settings.name]);
            },
          ),
        );
      },
    );
  }
}

final routes = {
  HomePage.routeName: (context) => HomePage(),
};
