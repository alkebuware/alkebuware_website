import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ADialog extends StatelessWidget {
  final Widget child;
  final String title;

  const ADialog({Key key, @required this.child, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 16 + getStatusBarHeight(context), left: 16, right: 16),
      height: getScreenHeight(context),
      width: getScreenWidth(context),
      decoration: BoxDecoration(gradient: lightBlueGradient),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                constraints:
                    BoxConstraints(maxWidth: getScreenWidth(context) - 80),
                child: Text(
                  title,
                  style: titleWhite36Bold,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
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
            child: child,
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
        appState.appBarNavigatorState.pushNamed(routeName);
      },
    );
  }
}
