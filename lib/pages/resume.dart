import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/container.dart';
import 'package:alkebuware_website/widgets/fab.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/thumbnail_viewer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumePage extends StatelessWidget {
  static final String routeName = "/resume";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Column(children: [
            AContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text("Professional Summary", style: titleADarkBlue24Bold),
                  Padding(
                      padding: EdgeInsets.only(top: 16, right: 32),
                      child: Text(
                          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem "
                          "ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                          "Lorem ipsum Lorem ipsum",
                          style: aDarkBlue16)),
                ])),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: AContainer(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("Education", style: titleADarkBlue24Bold),
                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                            "North Carolina Agricultural and Technical State University",
                            style: aDarkBlue16Medium)),
                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                            "August 2011 - May 2015 (Completed)\n"
                            "Bachelors or Science - Computer Engineering (Summa Cum Laude)",
                            style: aDarkBlue16)),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: AContainer(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("App Experience", style: titleADarkBlue24Bold),
                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text("Haqq App - Android and Node.js Developer",
                            style: aDarkBlue16Medium)),
                    Text("June 2016 - 2018", style: aDarkBlue16),
                    Text(
                        "I led development efforts in building a platform for a iOS "
                        "and Android based finder app. The platform also included a "
                        "third party loyalty program that grocers and restaurants to "
                        "use as well via an in-store kiosk we developed as a team.",
                        style: aDarkBlue16),
                    ThumbnailViewer(
                      assetPaths: [
                        "assets/images/haqq-app-home.png",
                        "assets/images/haqq-app-loyalty.png",
                        "assets/images/haqq-app-search.png",
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Text(
                            "Haqq Loyalty - Android and Node.js Developer",
                            style: aDarkBlue16Medium)),
                    Text("June 2016 - 2018", style: aDarkBlue16),
                    Text(
                        "Enterprise private loyalty program kiosk app that I "
                        "lead development efforts on. We installed the app onto"
                        " Android managed enterprise provisioned tablets in "
                        "stores to allow store owners/manager to manage, track,"
                        " and redeem their loyalty programs. Customers earned "
                        "points toward their purchases by enrolling in the a "
                        "grocer’s or restaurant’s loyalty program through Haqq "
                        "App.",
                        style: aDarkBlue16),
                    ThumbnailViewer(
                      assetPaths: [
                        "assets/images/haqq-loyalty-home.png",
                        "assets/images/haqq-loyalty-customer.png",
                        "assets/images/haqq-loyalty-analytics.png",
                      ],
                    )
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: AContainer(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("Additional Experience", style: titleADarkBlue24Bold),
                    Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Text(
                            "Hughes Network Systems, Embedded Linux Developer",
                            style: aDarkBlue16Medium)),
                    Text("May 2015 - June 2016", style: aDarkBlue16),
                    Text(
                        "Contributed to user space, kernel space, and custom "
                        "BSP development for proprietary custom ASIC. "
                        "Retrofitted Linux OS to allow over-the-air upgrades "
                        "of our embedded devices. Implemented VPN HW "
                        "acceleration that increased satellite speeds by 50%. "
                        "Implemented UDP protocol for iOT devices to "
                        "communicate with the hub side modems.",
                        style: aDarkBlue16),
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: AContainer(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text("Technical Skills", style: titleADarkBlue24Bold),
                    Container(
                      width: getScreenWidth(context) - 32,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Wrap(
                            runSpacing: 16,
                            spacing: 16,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              Tooltip(
                                  message: "Flutter",
                                  child: Image.asset(
                                      "assets/images/flutter-badge.png")),
                              Tooltip(
                                  message: "HTML5",
                                  child: Image.asset(
                                      "assets/images/html5-badge.png")),
                              Tooltip(
                                  message: "CSS3",
                                  child: Image.asset(
                                      "assets/images/css3-badge.png")),
                              Tooltip(
                                  message: "Dart",
                                  child: Image.asset(
                                      "assets/images/dart-badge.png")),
                              Tooltip(
                                  message: "Angular Dart",
                                  child: Image.asset(
                                      "assets/images/angulardart-badge.png")),
                              Tooltip(
                                  message: "Google Cloud Platform",
                                  child: Image.asset(
                                      "assets/images/gcp-badge.png")),
                              Tooltip(
                                  message: "Firebase",
                                  child: Image.asset(
                                      "assets/images/firebase-badge.png")),
                              Tooltip(
                                  message: "Postgres",
                                  child: Image.asset(
                                      "assets/images/postgres-badge.png")),
                              Tooltip(
                                  message: "Aqueduct",
                                  child: Image.asset(
                                      "assets/images/aqueduct-badge.png")),
                              Tooltip(
                                  message: "Javascript",
                                  child: Image.asset(
                                      "assets/images/js-badge.png")),
                            ]),
                      ),
                    ),
                  ])),
            ),
            Footer()
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: AFab(
                onPressed: () {
                  if (kIsWeb) {
                    launch("/resume.pdf");
                  } else {
                    print("can't show pdf in non-web");
                  }
                },
                backgroundColor: aOrange,
                child: Image.asset("assets/images/download.png")),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 88.0, right: 16.0),
          child: Align(
            alignment: Alignment.topRight,
            child: AFab(
                onPressed: () {
                  launch(
                      "https://www.linkedin.com/in/tariq-alkebu-lan-86670245/");
                },
                backgroundColor: linkedInBlue,
                child: Image.asset("assets/images/linkedin.png")),
          ),
        ),
      ],
    );
  }
}
