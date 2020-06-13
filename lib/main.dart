import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/pages/tesimonial_dialog.dart';
import 'package:alkebuware_website/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';
import 'pages/about.dart';
import 'pages/hire_me.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';
import 'pages/portfolio_detail.dart';
import 'pages/resume.dart';
import 'pages/services.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  GlobalKey<NavigatorState> _appBarNavigatorKey;
  String currentRoute;

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  NavigatorState get appBarNavigatorState => _appBarNavigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    _appBarNavigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Alkebuware - Let\'s Build Something Great',
      onGenerateRoute: (settings) {
        final name = settings.name;
        if (name == MenuDialog.routeName) {
          return MaterialPageRoute(
              builder: (_) => Material(child: MenuDialog()));
        } else if (name.startsWith(TestimonialDialog.routeName(""))) {
          return MaterialPageRoute(
              builder: (_) => Material(child: TestimonialDialog()));
        } else {
          return null;
        }
      },
      home: WillPopScope(
        onWillPop: () async {
          _appBarNavigatorKey.currentState.maybePop();
          return false;
        },
        child: Scaffold(
            appBar: AAppBar(navigatorKey: _appBarNavigatorKey),
            backgroundColor: backgroundGray,
            body: Navigator(
              key: _appBarNavigatorKey,
              onGenerateRoute: (settings) {
                currentRoute = settings?.name;
                if (settings.name
                    .startsWith(PortfolioDetailPage.routeName(""))) {
                  return MaterialPageRoute(
                      settings: settings,
                      builder: (context) => PortfolioDetailPage());
                } else {
                  return MaterialPageRoute(
                      settings: settings, builder: routes[settings.name]);
                }
              },
            )),
      ),
//      builder: (BuildContext context, Widget widget) {
//        return Material(
//          child: WillPopScope(
//            onWillPop: () async {
//              print("onwillpop");
//              return true;
//            },
//            child: Navigator(
//                key: _rootNavigatorKey,
//                onGenerateRoute: (settings) {
//                  if (settings.name == MenuDialog.routeName) {
//                    return MaterialPageRoute(
//                        builder: (context) => MenuDialog(),
//                        settings: settings,
//                        fullscreenDialog: true);
//                  } else if (settings.name
//                      .startsWith(TestimonialDialog.routeName(""))) {
//                    return MaterialPageRoute(
//                        builder: (context) => TestimonialDialog(),
//                        settings: settings,
//                        fullscreenDialog: true);
//                  } else {
//                    return MaterialPageRoute(
//                        builder: (context) {
//                          return Scaffold(
//                              appBar: AAppBar(navigatorKey: _appBarNavigatorKey),
//                              backgroundColor: backgroundGray,
//                              body: WillPopScope(
//                                onWillPop: () async {
//                                  print("onwillpop");
//                                  return true;
//                                },
//                                child: Navigator(
//                                  key: _appBarNavigatorKey,
//                                  onGenerateRoute: (settings) {
//                                    currentRoute = settings?.name;
//                                    if (settings.name == PortfolioPage.routeName) {
//                                      return MaterialPageRoute(
//                                          settings: settings,
//                                          builder: routes[settings.name]);
//                                    } else if (settings.name.startsWith(
//                                        PortfolioDetailPage.routeName(""))) {
//                                      return MaterialPageRoute(
//                                          settings: settings,
//                                          builder: (context) => WillPopScope(
//                                              onWillPop: () async {
//                                                print("will pop");
//                                                return true;
//                                              },
//                                              child: PortfolioDetailPage()));
//                                    } else {
//                                      return MaterialPageRoute(
//                                          settings: settings,
//                                          builder: routes[settings.name]);
//                                    }
//                                  },
//                                ),
//                              ));
//                        },
//                        settings: settings);
//                  }
//                }),
//          ),
//        );
//      },
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
