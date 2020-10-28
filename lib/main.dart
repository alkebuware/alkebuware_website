import 'dart:async';

import 'package:alkebuware_website/pages/hire_me_dialog.dart';
import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/widgets/page.dart';
import 'package:fluro_fork/fluro_fork.dart';
import 'package:flutter/cupertino.dart' hide Router;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:sentry/sentry.dart';

import 'pages/about.dart';
import 'pages/general_inquiry_dialog.dart';
import 'pages/hire_me.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';
import 'pages/portfolio_detail.dart';
import 'pages/resume.dart';
import 'pages/services.dart';
import 'pages/services_inquiry_dialog.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorObservers: [observer],
      navigatorKey: _navigatorKey,
      title: 'ALKEBUWARE | Let\'s Build Something Amazing',
      onGenerateRoute: router.generator,
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
    );
  }
}

final _navigatorKey = GlobalKey<NavigatorState>();
final router = ARouter(navigatorKey: _navigatorKey)
  ..define(MenuDialog.routeName, handler: Handler(handlerFunc: (_, __) {
    return MenuDialog();
  }))
  ..define(HireMeDialog.routeName, opaque: false,
      handler: Handler(handlerFunc: (_, __) {
    return HireMeDialog();
  }))
  ..define(GeneralInquiryDialog.routeName, opaque: false,
      handler: Handler(handlerFunc: (_, __) {
    return GeneralInquiryDialog();
  }))
  ..define(ServicesInquiryDialog.routeName, opaque: false,
      handler: Handler(handlerFunc: (_, __) {
    return ServicesInquiryDialog();
  }))
  ..define(HomePage.routeName, handler: Handler(handlerFunc: (_, __) {
    return APage(child: HomePage());
  }))
  ..define(HireMePage.routeName, handler: Handler(handlerFunc: (_, __) {
    return APage(child: HireMePage());
  }))
  ..define(PortfolioPage.routeName, handler: Handler(handlerFunc: (_, __) {
    return APage(child: PortfolioPage());
  }))
  ..define(PortfolioDetailPage.routeName(":id"),
      handler: Handler(handlerFunc: (_, __) {
    return APage(child: PortfolioDetailPage());
  }))
  ..define(ServicesPage.routeName, handler: Handler(handlerFunc: (_, __) {
    return APage(child: ServicesPage());
  }))
  ..define(AboutPage.routeName, handler: Handler(handlerFunc: (_, __) {
    return APage(child: AboutPage());
  }))
  ..define(ResumePage.routeName, handler: Handler(handlerFunc: (_, __) {
    return APage(child: ResumePage());
  }))
  ..notFoundHandler = Handler(handlerFunc:
      (BuildContext context, Map<String, List<String>> parameters) {
    return APage(child: HomePage());
  });

class AAppRoute extends AppRoute {
  bool opaque;

  AAppRoute(String route, handler,
      {this.opaque = true, TransitionType transitionType})
      : super(route, handler, transitionType: transitionType);
}

class ARouter extends Router {
  final RouteTree _routeTree = RouteTree();
  final GlobalKey<NavigatorState> navigatorKey;

  ARouter({this.navigatorKey});

  /// Prints the route tree so you can analyze it.
  void printTree() {
    _routeTree.printTree();
  }

  @override
  void define(String routePath,
      {@required Handler handler,
      TransitionType transitionType,
      bool opaque = true}) {
    _routeTree.addRoute(
      AAppRoute(routePath, handler,
          opaque: opaque, transitionType: transitionType),
    );
  }

  @override
  Future navigateTo(BuildContext context, String path,
      {bool replace = false,
        bool clearStack = false,
        TransitionType transition,
        Duration transitionDuration = const Duration(milliseconds: 250),
        transitionBuilder}) {
    RouteMatch routeMatch = matchRoute(context, path,
        transitionType: transition,
        transitionsBuilder: transitionBuilder,
        transitionDuration: transitionDuration);
    Route<dynamic> route = routeMatch.route;
    Completer completer = Completer();
    Future future = completer.future;
    if (routeMatch.matchType == RouteMatchType.nonVisual) {
      completer.complete("Non visual route type.");
    } else {
      if (route == null && notFoundHandler != null) {
        route = _notFoundRoute(context, path);
      }
      if (route != null) {
        if (clearStack) {
          future = navigatorKey?.currentState
              ?.pushAndRemoveUntil(route, (route) => false) ??
              Navigator.pushAndRemoveUntil(context, route, (check) => false);
        } else {
          future = replace
              ? (navigatorKey?.currentState?.pushReplacement(route) ??
              Navigator.pushReplacement(context, route))
              : (navigatorKey?.currentState?.push(route) ??
              Navigator.push(context, route));
        }
        completer.complete();
      } else {
        String error = "No registered route was found to handle '$path'.";
        print(error);
        completer.completeError(RouteNotFoundException(error, path));
      }
    }

    return future;
  }

  /// Finds a defined [AppRoute] for the path value. If no [AppRoute] definition was found
  /// then function will return null.
  AppRouteMatch match(String path) {
    return _routeTree.matchRoute(path);
  }

  ///
  RouteMatch matchRoute(BuildContext buildContext, String path,
      {RouteSettings routeSettings,
        TransitionType transitionType,
        Duration transitionDuration = const Duration(milliseconds: 250),
        RouteTransitionsBuilder transitionsBuilder}) {
    RouteSettings settingsToUse = routeSettings;
    if (routeSettings == null) {
      settingsToUse = RouteSettings(name: path);
    }
    AppRouteMatch match = _routeTree.matchRoute(path);
    AAppRoute route = match?.route;
    Handler handler = (route != null ? route.handler : notFoundHandler);
    var transition = transitionType;
    if (transitionType == null) {
      transition = route != null ? route.transitionType : TransitionType.native;
    }
    if (route == null && notFoundHandler == null) {
      return RouteMatch(
          matchType: RouteMatchType.noMatch,
          errorMessage: "No matching route was found");
    }
    Map<String, List<String>> parameters =
        match?.parameters ?? <String, List<String>>{};
    if (handler.type == HandlerType.function) {
      handler.handlerFunc(buildContext, parameters);
      return RouteMatch(matchType: RouteMatchType.nonVisual);
    }

    RouteCreator creator =
        (RouteSettings routeSettings, Map<String, List<String>> parameters) {
      bool isNativeTransition = (transition == TransitionType.native ||
          transition == TransitionType.nativeModal);
      if (isNativeTransition) {
        if (Theme
            .of(buildContext)
            .platform == TargetPlatform.iOS) {
          return CupertinoPageRoute<dynamic>(
              settings: routeSettings,
              fullscreenDialog: transition == TransitionType.nativeModal,
              builder: (BuildContext context) {
                return handler.handlerFunc(context, parameters);
              });
        } else {
          return MaterialPageRoute<dynamic>(
              settings: routeSettings,
              fullscreenDialog: transition == TransitionType.nativeModal,
              builder: (BuildContext context) {
                return handler.handlerFunc(context, parameters);
              });
        }
      } else if (transition == TransitionType.material ||
          transition == TransitionType.materialFullScreenDialog) {
        return MaterialPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog:
            transition == TransitionType.materialFullScreenDialog,
            builder: (BuildContext context) {
              return handler.handlerFunc(context, parameters);
            });
      } else if (transition == TransitionType.cupertino ||
          transition == TransitionType.cupertinoFullScreenDialog) {
        return CupertinoPageRoute<dynamic>(
            settings: routeSettings,
            fullscreenDialog:
            transition == TransitionType.cupertinoFullScreenDialog,
            builder: (BuildContext context) {
              return handler.handlerFunc(context, parameters);
            });
      } else {
        var routeTransitionsBuilder;
        if (transition == TransitionType.custom) {
          routeTransitionsBuilder = transitionsBuilder;
        } else {
          routeTransitionsBuilder = _standardTransitionsBuilder(transition);
        }
        return PageRouteBuilder<dynamic>(
          settings: routeSettings,
          opaque: route.opaque,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return handler.handlerFunc(context, parameters);
          },
          transitionDuration: transitionDuration,
          transitionsBuilder: routeTransitionsBuilder,
        );
      }
    };
    return RouteMatch(
      matchType: RouteMatchType.visual,
      route: creator(settingsToUse, parameters),
    );
  }

  RouteTransitionsBuilder _standardTransitionsBuilder(
      TransitionType transitionType) {
    return (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      if (transitionType == TransitionType.fadeIn) {
        return FadeTransition(opacity: animation, child: child);
      } else {
        const Offset topLeft = const Offset(0.0, 0.0);
        const Offset topRight = const Offset(1.0, 0.0);
        const Offset bottomLeft = const Offset(0.0, 1.0);
        Offset startOffset = bottomLeft;
        Offset endOffset = topLeft;
        if (transitionType == TransitionType.inFromLeft) {
          startOffset = const Offset(-1.0, 0.0);
          endOffset = topLeft;
        } else if (transitionType == TransitionType.inFromRight) {
          startOffset = topRight;
          endOffset = topLeft;
        }

        return SlideTransition(
          position: Tween<Offset>(
            begin: startOffset,
            end: endOffset,
          ).animate(animation),
          child: child,
        );
      }
    };
  }

  Route _notFoundRoute(BuildContext context, String path) {
    RouteCreator<Null> creator =
        (RouteSettings routeSettings, Map<String, List<String>> parameters) {
      return MaterialPageRoute<Null>(
          settings: routeSettings,
          builder: (BuildContext context) {
            return notFoundHandler.handlerFunc(context, parameters);
          });
    };
    return creator(RouteSettings(name: path), null);
  }
}

final observer = AObserver();

class AObserver extends NavigatorObserver {
  final _controllers = <StreamController<String>>[];
  String _currentRoute;

  String get currentRoute => _currentRoute;

  Stream<String> get currentRouteStream {
    _controllers.removeWhere((element) => element.isClosed);
    _controllers.add(StreamController<String>());
    _controllers.last.add(_currentRoute);
    return _controllers.last.stream;
  }

  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    _currentRoute = route.settings.name;
    _controllers.forEach((controller) {
      controller.add(_currentRoute);
    });
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
    _currentRoute = previousRoute?.settings?.name;
    _controllers.forEach((controller) {
      controller.add(_currentRoute);
    });
  }
}
