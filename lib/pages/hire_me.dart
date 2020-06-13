import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/pages/hire_me_dialog.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HireMePage extends StatelessWidget {
  static final String routeName = "/hire-me";

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _HireMeCard(
        title: "Hire an Expert",
        description:
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem "
            "ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem "
            "ipsum Lorem ipsum",
        callToAction: "Reach Out",
        onTap: () {
          final appState = AppState.of(context);
          appState.rootNavigatorState.pushNamed(HireMeDialog.routeName);
        },
        backgroundIconPath: "assets/images/hand-shake.png",
      ),
      _HireMeCard(
        title: "General Inquiry",
        description:
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem "
            "ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem "
            "ipsum Lorem ipsum",
        callToAction: "Send Inquiry",
        onTap: () {},
        backgroundIconPath: "assets/images/inquiry.png",
      ),
      Testimonials(),
      Footer(),
    ]);
  }
}

class _HireMeCard extends StatelessWidget {
  final String title;
  final String description;
  final String callToAction;
  final String backgroundIconPath;
  final VoidCallback onTap;

  const _HireMeCard(
      {Key key,
      @required this.title,
      @required this.description,
      @required this.callToAction,
      @required this.onTap,
      @required this.backgroundIconPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        color: aDarkBlue,
        elevation: 4,
        child: Stack(children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(backgroundIconPath)),
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
                child: GestureDetector(
                    child: Text(callToAction, style: titleAOrange24),
                    onTap: onTap),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
