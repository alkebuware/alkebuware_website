import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/dialog.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'about.dart';
import 'hire_me.dart';
import 'home.dart';
import 'portfolio.dart';
import 'resume.dart';
import 'services.dart';

class MenuDialog extends StatelessWidget {
  static const String routeName = "/menu";

  @override
  Widget build(BuildContext context) {
    return ADialog(
      title: "Menu",
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          NavigationButton(text: "Home", routeName: HomePage.routeName),
          NavigationButton(text: "Hire Me", routeName: HireMePage.routeName),
          NavigationButton(
              text: "Portfolio", routeName: PortfolioPage.routeName),
          NavigationButton(text: "Services", routeName: ServicesPage.routeName),
          NavigationButton(text: "About", routeName: AboutPage.routeName),
          NavigationButton(text: "Resume", routeName: ResumePage.routeName),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String routeName;
  final String text;

  const NavigationButton(
      {Key? key, required this.routeName, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouter.of(context).routeInformationProvider.value.uri.path;
    return ListenableBuilder(
        listenable: GoRouter.of(context).routeInformationProvider,
        builder: (context, _) {
          return RoundedButton(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
            text: text,
            textStyle: titleWhite36Bold,
            backgroundColor: currentPath == routeName
                ? Colors.white12
                : Colors.transparent,
            onTap: () {
              router.go(routeName);
            },
          );
        });
  }
}
