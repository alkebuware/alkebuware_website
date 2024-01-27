import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/container.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ResumePage extends StatelessWidget {
  static final String routeName = "/resume";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(children: [
          AContainer(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text("Professional Summary", style: titleADarkBlue24Bold),
                Padding(
                    padding: EdgeInsets.only(top: 16, right: 32, bottom: 16),
                    child: Text(
                        "Software engineer with 8+ years of "
                        "experience and 5+ years of Flutter experience "
                        "development and a background in embedded development."
                        "With experience working with multidisciplinary teams "
                        "using tools like Asana, and valuing "
                        "clean, concise, and well documented code I'm certain "
                        "I'd be a great asset to your team.",
                        style: aDarkBlue16)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text("""
• High level communicator, comfortable working with stakeholders, design teams, QA teams, product teams, etc.
• Experience working with internally and externally developed projects with a large code base and excellent with Git
• Familiarity with advanced computer science concepts including design patterns and algorithms (Big Fan of Uncle Bob)
• Mastery of the Dart (Flutter) development and hardware ecosystem from virtual  device to store: Google Play or Apple.
""", style: aDarkBlue16),
                        ),
                        Container(width: 16),
                        Flexible(
                          child: Text("""
• Experience with Android Guidelines, Certificates, Provisioning, and Play store submission
• Experience with Apple Guidelines, Certificates, Provisioning, and App store submission
• Extensive experience in backend functionality using web RESTful/JSON web services
• Experience building complex apps that have been successfully delivered to customers
• Good team player who is self motivated and well organized
• Exceptional analytical aptitude and attention to detail
""", style: aDarkBlue16),
                        )
                      ],
                    )
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: AContainer(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Row(
                    children: [
                      Expanded(
                          child:
                              Text("Education", style: titleADarkBlue24Bold)),
                    ],
                  ),
                  Wrap(
                      spacing: 32,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
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
                      ])
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
                          runSpacing: getValueForScreenType(
                              context: context, mobile: 16, desktop: 64),
                          spacing: getValueForScreenType(
                              context: context, mobile: 16, desktop: 150),
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            _Badge(
                                tooltip: "Flutter",
                                path: "assets/images/flutter-badge.png"),
                            _Badge(
                                tooltip: "HTML5",
                                path: "assets/images/html5-badge.png"),
                            _Badge(
                                tooltip: "CSS3",
                                path: "assets/images/css3-badge.png"),
                            _Badge(
                                tooltip: "Dart",
                                path: "assets/images/dart-badge.png"),
                            _Badge(
                                tooltip: "Angular Dart",
                                path: "assets/images/angulardart-badge.png"),
                            _Badge(
                                tooltip: "Google Cloud Platform",
                                path: "assets/images/gcp-badge.png"),
                            _Badge(
                                tooltip: "Firebase",
                                path: "assets/images/firebase-badge.png"),
                            _Badge(
                                tooltip: "Postgres",
                                path: "assets/images/postgres-badge.png"),
                            _Badge(
                                tooltip: "Aqueduct",
                                path: "assets/images/aqueduct-badge.png"),
                            _Badge(
                                tooltip: "Javascript",
                                path: "assets/images/js-badge.png"),
                          ]),
                    ),
                  ),
                ])),
          ),
          Footer()
        ]),
//        Padding(
//          padding: const EdgeInsets.only(top: 16.0, right: 16.0),
//          child: Align(
//            alignment: Alignment.topRight,
//            child: AFab(
//                onPressed: () {
//                  if (kIsWeb) {
//                    launch("/resume.pdf");
//                  } else {
//                    print("can't show pdf in non-web");
//                  }
//                },
//                backgroundColor: aOrange,
//                child: Image.asset("assets/images/download.png")),
//          ),
//        ),
//        Padding(
//          padding: const EdgeInsets.only(top: 88.0, right: 16.0),
//          child: Align(
//            alignment: Alignment.topRight,
//            child: AFab(
//                onPressed: () {
//                  launch(
//                      "https://www.linkedin.com/in/tariq-alkebu-lan-86670245/");
//                },
//                backgroundColor: linkedInBlue,
//                child: Image.asset("assets/images/linkedin.png")),
//          ),
//        ),
      ],
    );
  }
}

class _Badge extends StatelessWidget {
  final String path;
  final String tooltip;

  const _Badge({Key? key, required this.path, required this.tooltip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Image.asset(path),
      verticalOffset: -50,
    );
  }
}
