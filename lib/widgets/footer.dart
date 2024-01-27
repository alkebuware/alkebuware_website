import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/pages/about.dart';
import 'package:alkebuware_website/pages/hire_me.dart';
import 'package:alkebuware_website/pages/home.dart';
import 'package:alkebuware_website/pages/portfolio.dart';
import 'package:alkebuware_website/pages/resume.dart';
import 'package:alkebuware_website/pages/services.dart';
import 'package:alkebuware_website/text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'rounded_button.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (context) => _Mobile(),
      tablet: (context) => _Mobile(),
      desktop: (context) => _Desktop(),
    );
  }
}

class _Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Container(
        height: 400,
        padding: EdgeInsets.only(left: 32, right: 32, top: 64, bottom: 16),
        color: aDarkBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Let me build the app you need",
              style: titleWhite42Bold,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _Button(routeName: HomePage.routeName, text: "Home"),
                _Button(routeName: PortfolioPage.routeName, text: "Portfolio"),
                _Button(routeName: AboutPage.routeName, text: "About"),
                _Button(routeName: HireMePage.routeName, text: "Contact"),
                _Button(routeName: ServicesPage.routeName, text: "Services"),
                _Button(routeName: ResumePage.routeName, text: "Resume"),
              ],
            ),
            Text(
              "© 2020 ALKEBUWARE LLC. All Rights Reserved",
              style: white16,
            )
          ],
        ),
      ),
    );
  }
}

class _Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 16),
        color: aDarkBlue,
        child: Column(
          children: <Widget>[
            Text(
              "Let me build the app you need",
              style: titleWhite42Bold,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      _Button(routeName: HomePage.routeName, text: "Home"),
                      _Button(
                          routeName: PortfolioPage.routeName,
                          text: "Portfolio"),
                      _Button(routeName: AboutPage.routeName, text: "About"),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      _Button(routeName: HireMePage.routeName, text: "Contact"),
                      _Button(
                          routeName: ServicesPage.routeName, text: "Services"),
                      _Button(routeName: ResumePage.routeName, text: "Resume"),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "© 2022 ALKEBUWARE LLC. All Rights Reserved",
                style: white16,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String routeName;
  final String text;

  const _Button({Key? key, required this.routeName, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: RoundedButton(
        backgroundColor: Colors.transparent,
        text: text,
        textStyle: titleWhite24,
        onTap: () => router.go(routeName),
      ),
    );
  }
}
