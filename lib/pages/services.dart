import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/container.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'services_inquiry_dialog.dart';

class ServicesPage extends StatelessWidget {
  static final String routeName = "/services";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AContainer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Services", style: titleADarkBlue24Bold),
        Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem "
                "ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum",
                style: aDarkBlue16)),
      ])),
      Container(
          child: Wrap(
        spacing: 16,
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: _ServicesCard(
                title: "Web & App Development",
                description:
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum ",
                onTap: () {
                  final appState = AppState.of(context);
                  appState.rootNavigatorState.pushNamed(
                      ServicesInquiryDialog.routeName,
                      arguments: {"title": "Development Inquiry"});
                },
                backgroundIconPath: "assets/images/development.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: _ServicesCard(
                title: "Consulting",
                description:
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum ",
                onTap: () {
                  final appState = AppState.of(context);
                  appState.rootNavigatorState.pushNamed(
                      ServicesInquiryDialog.routeName,
                      arguments: {"title": "Consulting"});
                },
                backgroundIconPath: "assets/images/consulting.png"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32),
            child: _ServicesCard(
                title: "UI Design",
                description:
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                    "Lorem ipsum Lorem ipsum Lorem ipsum ",
                onTap: () {
                  final appState = AppState.of(context);
                  appState.rootNavigatorState.pushNamed(
                      ServicesInquiryDialog.routeName,
                      arguments: {"title": "UI Design Inquiry"});
                },
                backgroundIconPath: "assets/images/ui-design2.png"),
          ),
        ],
      )),
      Footer()
    ]);
  }
}

class _ServicesCard extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundIconPath;
  final VoidCallback onTap;

  const _ServicesCard(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.onTap,
      @required this.backgroundIconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxWidth: getValueForScreenType(
              context: context, mobile: double.infinity, desktop: 480)),
      decoration: BoxDecoration(
        color: aDarkBlue,
        boxShadow: kElevationToShadow[4],
        image: DecorationImage(
            image: AssetImage(backgroundIconPath), fit: BoxFit.fitHeight),
        borderRadius: BorderRadius.circular(
            getValueForScreenType(context: context, desktop: 16, mobile: 0)),
//        borderRadius: getValueForScreenType(
//            mobile: null, desktop: BorderRadius.circular(16)),
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: titleWhite16),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(description, style: white16),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SquaredButton(
                  textStyle: titleAOrange24,
                  text: "Send Inquiry",
                  backgroundColor: Colors.transparent,
                  onTap: onTap),
            ),
          ]),
        )
      ]),
    );
  }
}
