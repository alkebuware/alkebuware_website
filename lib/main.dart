import 'dart:async';

import 'package:alkebuware_website/pages/hire_me_dialog.dart';
import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/widgets/app_bar.dart';
import 'package:alkebuware_website/widgets/scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';
import 'package:url_launcher/url_launcher.dart';

import 'colors.dart';
import 'pages/about.dart';
import 'pages/general_inquiry_dialog.dart';
import 'pages/hire_me.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';
import 'pages/portfolio_detail.dart';
import 'pages/resume.dart';
import 'pages/services.dart';
import 'pages/services_inquiry_dialog.dart';
import 'widgets/fab.dart';

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
  GlobalKey _appBarKey;
  String currentRoute;

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType();
  }

  NavigatorState get appBarNavigatorState => _appBarNavigatorKey.currentState;

  NavigatorState get rootNavigatorState => _rootNavigatorKey.currentState;

  State get appBarState => _appBarKey.currentState;

  @override
  void initState() {
    super.initState();
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
        } else if (name == HireMeDialog.routeName) {
          return PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) => HireMeDialog(),
              settings: settings);
        } else if (name == GeneralInquiryDialog.routeName) {
          return PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) => GeneralInquiryDialog(),
              settings: settings);
        } else if (name == ServicesInquiryDialog.routeName) {
          return PageRouteBuilder(
              opaque: false,
              pageBuilder: (_, __, ___) => ServicesInquiryDialog(),
              settings: settings);
        } else {
          _appBarKey = GlobalKey();
          _appBarNavigatorKey = GlobalKey<NavigatorState>();
          return MaterialPageRoute(
              builder: (_) => Material(
                      child: WillPopScope(
                    onWillPop: () async {
                      _appBarNavigatorKey.currentState.maybePop();
                      return false;
                    },
                    child: Scaffold(
                        appBar: AAppBar(
                            key: _appBarKey, navigatorKey: _appBarNavigatorKey),
                        backgroundColor: backgroundGray,
                        floatingActionButtonLocation:
                        FloatingActionButtonLocation.endDocked,
                        floatingActionButton: _floatingActionButton,
                        body: Navigator(
                          key: _appBarNavigatorKey,
                          onGenerateRoute: (settings) {
                            currentRoute = settings?.name;
                            Future.delayed(Duration(), () =>
                                setState(() => currentRoute = settings?.name));
                            final controller = ScrollController();
                            return MaterialPageRoute(
                                settings: settings,
                                builder: (_) => AScrollBar(
                                  controller: controller,
                                  child: SingleChildScrollView(
                                      controller: controller,
                                      child: routes[routes.keys
                                          .firstWhere(_match)](context)),
                                ));
                          },
                        )),
                  )));
        }
      },
//      home: WillPopScope(
//        onWillPop: () async {
//          _appBarNavigatorKey.currentState.maybePop();
//          return false;
//        },
//        child: Scaffold(
//            appBar: AAppBar(navigatorKey: _appBarNavigatorKey),
//            backgroundColor: backgroundGray,
//            body: Navigator(
//              key: _appBarNavigatorKey,
//              onGenerateRoute: (settings) {
//                currentRoute = settings?.name;
//                final controller = ScrollController();
//                return MaterialPageRoute(
//                    settings: settings,
//                    builder: (_) => AScrollBar(
//                          controller: controller,
//                          child: SingleChildScrollView(
//                              controller: controller,
//                              child: routes[routes.keys.firstWhere(_match)](
//                                  context)),
//                        ));
//              },
//            )),
//      ),
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
    );
  }

  Widget get _floatingActionButton {
    Widget child;
    if (currentRoute == ResumePage.routeName) {
      child = Column(children: [
        AFab(
            onPressed: () {
              if (kIsWeb) {
                launch("/resume.pdf");
              } else {
                print("can't show pdf in non-web");
              }
            },
            backgroundColor: aOrange,
            child: Image.asset("assets/images/download.png")),
        Padding(
          padding: const EdgeInsets.only(top: 32.0),
          child: AFab(
              onPressed: () {
                launch(
                    "https://www.linkedin.com/in/tariq-alkebu-lan-86670245/");
              },
              backgroundColor: linkedInBlue,
              child: Image.asset("assets/images/linkedin.png")),
        ),
      ]);
    } else {
      child = Container();
    }

    return Padding(padding: EdgeInsets.only(top: 112, right: 16), child: child);
  }

  bool _match(String name) {
    final matcher =
    name.split("/").map((e) => e.contains(":") ? "*" : e).toList();
    final route = currentRoute.split("/").toList();
    if (route.length != matcher.length) {
      return false;
    }
    for (int i = 0; i < route.length; i++) {
      if (route[i] != matcher[i] && matcher[i] != "*") return false;
    }
    return true;
  }
}

final routes = {
  HomePage.routeName: (context) => HomePage(),
  HireMePage.routeName: (context) => HireMePage(),
  PortfolioPage.routeName: (context) => PortfolioPage(),
  ServicesPage.routeName: (context) => ServicesPage(),
  AboutPage.routeName: (context) => AboutPage(),
  ResumePage.routeName: (context) => ResumePage(),
  PortfolioDetailPage.routeName(":id"): (context) => PortfolioDetailPage(),
};
