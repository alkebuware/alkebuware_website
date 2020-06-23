import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/pages/about.dart';
import 'package:alkebuware_website/pages/general_inquiry_dialog.dart';
import 'package:alkebuware_website/pages/hire_me.dart';
import 'package:alkebuware_website/pages/home.dart';
import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/pages/portfolio.dart';
import 'package:alkebuware_website/pages/resume.dart';
import 'package:alkebuware_website/pages/services.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'rounded_button.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AAppBar({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _MobileAAppbar(
        navigatorKey: navigatorKey,
      ),
      tablet: _MobileAAppbar(
        navigatorKey: navigatorKey,
      ),
      desktop: _TabletAAppbar(
        navigatorKey: navigatorKey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class _TabletAAppbar extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const _TabletAAppbar({Key key, this.navigatorKey}) : super(key: key);

  @override
  __TabletAAppbarState createState() => __TabletAAppbarState();
}

class __TabletAAppbarState extends State<_TabletAAppbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        color: aDarkBlue,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 16 + getStatusBarHeight(context),
            bottom: 16,
          ),
          child: Row(children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (AppState.of(context).currentRoute !=
                          HomePage.routeName) {
                        AppState.of(context)
                            .appBarNavigatorState
                            .pushNamed(HomePage.routeName);
                        setState(() {});
                      }
                    },
                    splashColor: Colors.white24,
                    highlightColor: Colors.white24,
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/full-logo.png",
                      height: 50,
                    ),
                  ),
                ),
              ),
            ),
            _NavigationButton(
                state: this, routeName: HomePage.routeName, text: "Home"),
            _NavigationButton(
                state: this, routeName: HireMePage.routeName, text: "Hire me"),
            _NavigationButton(
                state: this,
                routeName: PortfolioPage.routeName,
                text: "Portfolio"),
            _NavigationButton(
                state: this,
                routeName: ServicesPage.routeName,
                text: "Services"),
            _NavigationButton(
                state: this, routeName: AboutPage.routeName, text: "About"),
            _NavigationButton(
                state: this, routeName: ResumePage.routeName, text: "Resume"),
            LetsChatButton(),
          ]),
        ),
      ),
    );
  }
}

class _MobileAAppbar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const _MobileAAppbar({Key key, this.navigatorKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      child: Container(
        color: aDarkBlue,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16,
            top: 16 + getStatusBarHeight(context),
            bottom: 16,
          ),
          child: Row(children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (AppState.of(context).currentRoute !=
                          HomePage.routeName) {
                        AppState
                            .of(context)
                            .appBarNavigatorState
                            .pushNamed(HomePage.routeName);
                      }
                    },
                    splashColor: Colors.white24,
                    highlightColor: Colors.white24,
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 50,
                    ),
                  ),
                ),
              ),
            ),
            LetsChatButton(),
            _MenuButton(),
          ]),
        ),
      ),
    );
  }
}

class LetsChatButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32.0),
      child: RoundedButton(
        backgroundColor: Colors.white,
        text: "Let's Chat 😀",
        textStyle: aOrange14Medium,
        onTap: () {
          final appState = AppState.of(context);
          appState.rootNavigatorState.pushNamed(GeneralInquiryDialog.routeName);
        },
      ),
    );
  }
}


class _NavigationButton extends StatelessWidget {
  final String routeName;
  final String text;
  final State state;

  const _NavigationButton(
      {Key key, @required this.routeName, @required this.text, this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return SquaredButton(
      backgroundColor: Colors.transparent,
      text: text,
      onTap: () {
        appState.appBarNavigatorState.pushNamed(routeName);
        // ignore: invalid_use_of_protected_member
        state.setState(() {});
      },
      textStyle: appState.currentRoute == routeName ? white16 : white5416,
    );
  }
}

class _MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          highlightColor: Colors.white24,
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            Navigator.pushNamed(context, MenuDialog.routeName);
          },
          child: Column(
            children: <Widget>[
              Text("Menu", style: white12Medium),
              Image.asset(
                "assets/images/menu.png",
                width: 42,
              )
            ],
          ),
        ),
      ),
    );
  }
}
