import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'about.dart';
import 'hire_me.dart';
import 'home.dart';
import 'portfolio.dart';
import 'resume.dart';
import 'services.dart';

class MenuDialog extends StatelessWidget {
  static const String routeName = "menu";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 16 + getStatusBarHeight(context),
          bottom: 16,
          left: 16,
          right: 16),
      height: getScreenHeight(context),
      width: getScreenWidth(context),
      decoration: BoxDecoration(gradient: lightBlueGradient),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Menu", style: titleWhite36Bold),
              IconButton(
                  icon: Image.asset("assets/images/close.png"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
          Container(
            constraints:
                BoxConstraints(maxHeight: getScreenHeight(context) - 104),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavigationButton(text: "Home", routeName: HomePage.routeName),
                NavigationButton(
                    text: "Hire Me", routeName: HireMePage.routeName),
                NavigationButton(
                    text: "Portfolio", routeName: PortfolioPage.routeName),
                NavigationButton(
                    text: "Services", routeName: ServicesPage.routeName),
                NavigationButton(text: "About", routeName: AboutPage.routeName),
                NavigationButton(
                    text: "Resume", routeName: ResumePage.routeName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String routeName;
  final String text;

  const NavigationButton(
      {Key key, @required this.routeName, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return RoundedButton(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      text: text,
      textStyle: titleWhite36Bold,
      backgroundColor: appState.currentRoute == routeName
          ? Colors.white12
          : Colors.transparent,
      onTap: () {
        Navigator.pop(context);
        appState.appBarNavigatorState
            .pushNamed(routeName);
      },
    );
  }
}
