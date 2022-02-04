import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ADialog extends StatelessWidget {
  final Widget child;
  final String title;

  const ADialog({Key key, @required this.child, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(context),
      height: getScreenHeight(context),
      color: Colors.black54,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          constraints: BoxConstraints(
              maxWidth: getValueForScreenType(
                  context: context,
                  mobile: getScreenWidth(context),
                  desktop: 800),
              maxHeight: getValueForScreenType(
                  context: context,
                  mobile: getScreenHeight(context),
                  desktop: 500)),
          padding: EdgeInsets.only(
              top: 16 + getStatusBarHeight(context), left: 16, right: 16),
          height: getValueForScreenType(
              context: context,
              mobile: getScreenHeight(context),
              tablet: getScreenHeight(context),
              desktop: null),
          width: getValueForScreenType(
              context: context,
              mobile: getScreenWidth(context),
              tablet: getScreenWidth(context),
              desktop: null),
          decoration: BoxDecoration(
              gradient: lightBlueGradient,
              borderRadius: BorderRadius.circular(getValueForScreenType(
                  context: context, mobile: 0, tablet: 0, desktop: 16))),
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
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        icon: Image.asset("assets/images/close.png"),
                        onPressed: () {
                          router.pop(context);
                        }),
                  )
                ],
              ),
              Flexible(child: child),
            ],
          ),
        ),
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
    return StreamBuilder<String>(
        stream: observer.currentRouteStream,
        builder: (context, snapshot) {
          return RoundedButton(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
            text: text,
            textStyle: titleWhite36Bold,
            backgroundColor: snapshot.data == routeName
                ? Colors.white12
                : Colors.transparent,
            onTap: () {
              router.pop(context);
              router.navigateTo(context, routeName);
            },
          );
        }
    );
  }
}
