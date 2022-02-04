import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/pages/general_inquiry_dialog.dart';
import 'package:alkebuware_website/pages/hire_me_dialog.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
import 'package:flutter/material.dart';

class HireMePage extends StatelessWidget {
  static final String routeName = "/hire-me";

  @override
  Widget build(BuildContext context) {
    return Wrap(alignment: WrapAlignment.center, children: [
      _HireMeCard(
        title: "Hire an Expert",
        description:
            "Are you looking to hire an app developer? Or maybe you need someone to "
            "walk you through the process of launching an app? Or you’re a "
            "start-up founder looking for a technical co-founder to help launch "
            "your dream product? Either way, tap that button below to send me the "
            "details on your project and I’ll get back to you within 24 hours.",
        callToAction: "Reach Out",
        onTap: () {
          router.navigateTo(context, HireMeDialog.routeName);
        },
        backgroundIconPath: "assets/images/hand-shake.png",
      ),
      _HireMeCard(
        title: "General Inquiry",
        description:
            "Feel free to reach out if you have any questions or comments "
            "about the services I offer. I also always appreciate a friendly "
            "hello. So tap that button but below and send away.",
        callToAction: "Send Inquiry",
        onTap: () {
          router.navigateTo(context, GeneralInquiryDialog.routeName);
        },
        backgroundIconPath: "assets/images/inquiry.png",
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Testimonials(),
      ),
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
      child: Container(
        constraints: BoxConstraints(maxWidth: 480),
        child: Card(
          color: aDarkBlue,
          elevation: 4,
          child: Stack(children: [
            Align(
                alignment: Alignment.center,
                child: Image.asset(backgroundIconPath)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: titleWhite16),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(description, style: white16),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SquaredButton(
                          textStyle: titleAOrange24,
                          text: callToAction,
                          backgroundColor: Colors.transparent,
                          onTap: onTap),
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
