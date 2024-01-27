import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/extensions/build_context.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ADialog extends StatelessWidget {
  final Widget child;
  final String title;
  final Color? backgroundColor;
  final TextStyle titleTextStyle;

  const ADialog(
      {Key? key,
      required this.child,
      required this.title,
      this.backgroundColor,
      this.titleTextStyle = titleWhite36Bold})
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
              color: backgroundColor,
              gradient: backgroundColor == null ? lightBlueGradient : null,
              borderRadius: BorderRadius.circular(getValueForScreenType(
                  context: context, mobile: 0, tablet: 0, desktop: 16))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                top: 16 + getStatusBarHeight(context), left: 16, right: 16, bottom: 16),
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      title,
                      style: titleTextStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        icon: titleTextStyle.color == Colors.white
                            ? Image.asset("assets/images/close.png")
                            : Image.asset("assets/images/close-dark-blue.png"),
                        onPressed: () {
                          context.back();
                        }),
                  )
                ],
              ),
              child,
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
      {Key? key, required this.routeName, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: context.router.routeInformationProvider,
        builder: (context, _) {
          return RoundedButton(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
            text: text,
            textStyle: titleWhite36Bold,
            backgroundColor: context.currentRoute == routeName
                ? Colors.white12
                : Colors.transparent,
            onTap: () {
              router.go(routeName);
            },
          );
        });
  }
}
