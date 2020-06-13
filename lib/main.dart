import 'dart:async';

import 'package:alkebuware_website/pages/hire_me_dialog.dart';
import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/pages/tesimonial_dialog.dart';
import 'package:alkebuware_website/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';

import 'colors.dart';
import 'pages/about.dart';
import 'pages/hire_me.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';
import 'pages/portfolio_detail.dart';
import 'pages/resume.dart';
import 'pages/services.dart';

final SentryClient sentry = SentryClient(
    dsn:
        "https://43456dfe4c6e4ac09723030b960588c0@o365045.ingest.sentry.io/5275606");

void main() => runZoned(() => runApp(App()), onError: (error, stackTrace) {
      try {
        sentry.captureException(exception: error, stackTrace: stackTrace);
        print(error);
        print(stackTrace);
      } catch (e) {
        print("Sending report to sentry.io failed: $e");
        print(error);
        print(stackTrace);
      }
    });

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

  NavigatorState get appBarNavigatorState => _appBarNavigatorKey.currentState;

  NavigatorState get rootNavigatorState => _rootNavigatorKey.currentState;

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
      navigatorKey: _rootNavigatorKey,
      onGenerateRoute: (settings) {
        final name = settings.name;
        if (name == MenuDialog.routeName) {
          return MaterialPageRoute(
              builder: (_) => Material(child: MenuDialog()));
        } else if (name.startsWith(TestimonialDialog.routeName(""))) {
          return MaterialPageRoute(
              builder: (_) => Material(child: TestimonialDialog()),
              settings: settings);
        } else if (name == HireMeDialog.routeName) {
          return MaterialPageRoute(
              builder: (_) => Material(child: HireMeDialog()),
              settings: settings);
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
