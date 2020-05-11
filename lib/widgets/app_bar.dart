import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/pages/home.dart';
import 'package:alkebuware_website/pages/menu_dialog.dart';
import 'package:alkebuware_website/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'rouded_button.dart';

class AAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const AAppBar({Key key, this.navigatorKey}) : super(key: key);

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
                        navigatorKey.currentState
                            .pushReplacementNamed(HomePage.routeName);
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
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: RoundedButton(
                backgroundColor: Colors.white,
                text: "Let's Chat 😀",
                textStyle: aOrange10Medium,
              ),
            ),
            MenuButton(),
          ]),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}

class MenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white24,
          highlightColor: Colors.white24,
          borderRadius: BorderRadius.circular(100),
          onTap: () {
            print("menu tap");
            final appState = AppState.of(context);
            appState.rootNavigatorState.pushNamed(MenuDialog.routeName);
          },
          child: Column(
            children: <Widget>[
              Text("Menu", style: white10Medium),
              Image.asset("assets/images/menu.png")
            ],
          ),
        ),
      ),
    );
  }
}
