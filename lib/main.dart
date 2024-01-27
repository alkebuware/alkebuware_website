import 'dart:async';

import 'package:alkebuware_website/pages/general_inquiry_dialog.dart';
import 'package:alkebuware_website/pages/hire_me_dialog.dart';
import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/pages/services_inquiry_dialog.dart';
import 'package:alkebuware_website/pages/testimonial_dialog.dart';
import 'package:alkebuware_website/widgets/dialog_page.dart';
import 'package:alkebuware_website/widgets/page.dart';
import 'package:flutter/cupertino.dart' hide Router;
import 'package:flutter/material.dart' hide Router;
import 'package:go_router/go_router.dart';
import 'package:sentry/sentry.dart';

import 'pages/about.dart';
import 'pages/hire_me.dart';
import 'pages/home.dart';
import 'pages/portfolio.dart';
import 'pages/portfolio_detail.dart';
import 'pages/resume.dart';
import 'pages/services.dart';

final SentryClient sentry = SentryClient(SentryOptions(
    dsn:
        "https://43456dfe4c6e4ac09723030b960588c0@o365045.ingest.sentry.io/5275606"));

void main() => runZonedGuarded(() => runApp(App()), (error, stackTrace) {
      try {
        sentry.captureException(error, stackTrace: stackTrace);
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
    return CupertinoApp.router(
      title: 'ALKEBUWARE | Let\'s Build Something Amazing',
      localizationsDelegates: [DefaultMaterialLocalizations.delegate],
      routerConfig: router,
    );
  }
}

final router = GoRouter(
    routes: [
      GoRoute(path: MenuDialog.routeName, builder: (_, __) => MenuDialog()),
      GoRoute(
          path: TestimonialDialog.routeName(":id"),
          pageBuilder: (_, state) {
            final id = int.parse(state.pathParameters["id"] ?? "");
            return DialogPage(builder: (context) {
              return TestimonialDialog(id: id);
            });
          }),
      GoRoute(
          path: HireMeDialog.routeName,
          pageBuilder: (_, __) {
            return DialogPage(builder: (context) => HireMeDialog());
          }),
      GoRoute(
          path: GeneralInquiryDialog.routeName,
          pageBuilder: (_, __) {
            return DialogPage(builder: (context) => GeneralInquiryDialog());
          }),
      GoRoute(
          path: ServicesInquiryDialog.routeName,
          pageBuilder: (_, __) {
            return DialogPage(builder: (context) => ServicesInquiryDialog());
          }),
      GoRoute(
          path: HomePage.routeName,
          builder: (_, __) => APage(child: HomePage())),
      GoRoute(
          path: AboutPage.routeName,
          builder: (_, __) => APage(child: AboutPage())),
      GoRoute(
          path: HireMePage.routeName,
          builder: (_, __) => APage(child: HireMePage())),
      GoRoute(
          path: PortfolioPage.routeName,
          builder: (_, __) => APage(child: PortfolioPage())),
      GoRoute(
          path: PortfolioDetailPage.routeName(":id"),
          builder: (_, state) {
            final id = int.parse(state.pathParameters["id"] ?? "");
            return APage(child: PortfolioDetailPage(id: id));
          }),
      GoRoute(
          path: ServicesPage.routeName,
          builder: (_, __) => APage(child: ServicesPage())),
      GoRoute(
          path: AboutPage.routeName,
          builder: (_, __) => APage(child: HomePage())),
      GoRoute(
          path: ResumePage.routeName,
          builder: (_, __) => APage(child: ResumePage())),
    ],
    onException: (context, state, router) {
      router.go(HomePage.routeName);
    });
