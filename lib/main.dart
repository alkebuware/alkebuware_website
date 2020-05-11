import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/about.dart';
import 'pages/hire_me.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';
import 'pages/resume.dart';
import 'pages/services.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  GlobalKey<NavigatorState> _appBarNavigatorKey;
  GlobalKey<NavigatorState> _rootNavigatorKey;
  String currentRoute;

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  NavigatorState get rootNavigatorState => _rootNavigatorKey.currentState;

  NavigatorState get appBarNavigatorState => _appBarNavigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    _appBarNavigatorKey = GlobalKey<NavigatorState>();
    _rootNavigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Alkebuware - Let\'s Build Something Great',
      builder: (BuildContext context, Widget widget) {
        return Material(
          child: Navigator(
              key: _rootNavigatorKey,
              onGenerateRoute: (settings) {
                print("root navigate to: ${settings.name}");
                if (settings.name == MenuDialog.routeName) {
                  return MaterialPageRoute(
                      builder: (context) => MenuDialog(),
                      settings: settings,
                      fullscreenDialog: true);
                } else {
                  return MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                            appBar: AAppBar(navigatorKey: _appBarNavigatorKey),
                            body: Navigator(
                              key: _appBarNavigatorKey,
                              onGenerateRoute: (settings) {
                                print("app bar navigate to: ${settings?.name}");
                                currentRoute = settings?.name;
                                return MaterialPageRoute(
                                    settings: settings,
                                    builder: routes[settings.name]);
                              },
                            ));
                      },
                      settings: settings);
                }
              }),
        );
      },
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
    );
  }
}

final routes = {
  HomePage.routeName: (context) => HomePage(),
  HireMePage.routeName: (context) => HireMePage(),
  PortfolioPage.routeName: (context) => PortfolioPage(),
  ServicesPage.routeName: (context) => ServicesPage(),
  AboutPage.routeName: (context) => AboutPage(),
  ResumePage.routeName: (context) => ResumePage(),
};
