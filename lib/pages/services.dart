import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/container.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:flutter/material.dart';
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
                "Having worked with a number of founders, business owners, and "
                "CEOs alike, I’ve learned to help entrepreneurs in a number of "
                "different ways. Whether it’s building an app, designing the "
                "UI for an app, or you just need a sounding board to bounce "
                "your ideas off. I’m sure I can help you reach your business "
                "goals.",
                style: aDarkBlue16)),
      ])),
      Container(
          constraints: BoxConstraints(maxWidth: 1024),
          child: Wrap(
            spacing: 16,
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: _ServicesCard(
                    title: "Web & App Development",
                    description:
                        "I offer mobile and web application development services "
                        "to build the app you need. Using one of the latest "
                        "technologies in hybrid mobile application development, "
                        "Flutter. I can build you an Android, iOS, and Web "
                        "application with one codebase. Tap the button below to "
                        "send an inquiry to learn more about how I can help with "
                        "developing your app.",
                    onTap: () {
                      ServicesInquiryDialogState.title = "Development Inquiry";
                      router.push(ServicesInquiryDialog.routeName);
                    },
                    backgroundIconPath: "assets/images/development.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: _ServicesCard(
                    title: "Consulting",
                    description:
                        "Sometimes during the early stages of launching a new "
                        "digital product you may need help with figuring out a "
                        "timeline, or an estimate of the costs, or a general "
                        "overview of the process of getting your very own app in "
                        "the iOS and Android stores. This is doubly true if you’re "
                        "a new entrepreneur. Tap the button below to send an "
                        "inquiry to learn more about how I can help you learn how "
                        "to launch the app you need.",
                    onTap: () {
                      ServicesInquiryDialogState.title = "Consulting";
                      router.push(ServicesInquiryDialog.routeName);
                    },
                    backgroundIconPath: "assets/images/consulting.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: _ServicesCard(
                    title: "UI Design",
                    description:
                        "So you know the steps to launch your digital product? You "
                        "now need someone that can execute your vision and have "
                        "them create the design, look, and feel of your product. I "
                        "can help with this too. Tap the button below to send an "
                        "inquiry to learn more about how I can bring your app to "
                        "life.",
                    onTap: () {
                      ServicesInquiryDialogState.title = "UI Design Inquiry";
                      router.push(ServicesInquiryDialog.routeName);
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
      {Key? key,
      required this.title,
      required this.description,
      required this.onTap,
      required this.backgroundIconPath})
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
