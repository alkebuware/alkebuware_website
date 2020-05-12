import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/pages/tesimonial_dialog.dart';
import 'package:alkebuware_website/text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Testimonials extends StatefulWidget {
  @override
  _TestimonialsState createState() => _TestimonialsState();
}

class _TestimonialsState extends State<Testimonials> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxHeight: 310),
          child: PageView(
            controller: _controller,
            children: allTestimonials
                .map((e) => TestimonialCard(testimonial: e))
                .toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SmoothPageIndicator(
            controller: _controller,
            count: allTestimonials.length,
            effect: ExpandingDotsEffect(activeDotColor: aLightBlue),
          ),
        )
      ],
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialCard({Key key, @required this.testimonial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final appState = AppState.of(context);
        appState.rootNavigatorState.pushNamed(TestimonialDialog.routeName(
            allTestimonials.indexOf(testimonial).toString()));
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TestimonialContent(testimonial: testimonial),
        ),
      ),
    );
  }
}

class TestimonialContent extends StatelessWidget {
  final Testimonial testimonial;
  final int maxLines;

  const TestimonialContent({Key key, this.testimonial, this.maxLines = 4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(testimonial.assetName),
                      fit: BoxFit.cover),
                  boxShadow: kElevationToShadow[6]),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: testimonial.services.map((s) {
                    switch (s) {
                      case Service.uiDesign:
                        return Image.asset("assets/images/ui-design.png");
                        break;
                      case Service.appDevelopment:
                        return Image.asset("assets/images/app-development.png");
                        break;
                      case Service.webDevelopment:
                        return Image.asset("assets/images/web-development.png");
                        break;
                    }
                    return Container();
                  }).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: ServiceText(services: testimonial.services),
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            testimonial.text,
            style: aDarkBlue16,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(testimonial.name, style: titleADarkBlue16Bold),
              Text(
                "${testimonial.position} @ ${testimonial.company}",
                style: aDarkBlue16,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ServiceText extends StatelessWidget {
  final List<Service> services;

  const ServiceText({Key key, @required this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StringBuffer buffer = StringBuffer();
    for (Service s in services) {
      if (buffer.isNotEmpty && s == services.last) {
        buffer.write(", and ");
      } else if (buffer.isNotEmpty) {
        buffer.write(", ");
      }
      switch (s) {
        case Service.uiDesign:
          buffer.write("UI Design");
          break;
        case Service.appDevelopment:
          buffer.write("App Development");
          break;
        case Service.webDevelopment:
          buffer.write("Web Development");
          break;
      }
    }
    return Text(
      buffer.toString(),
      style: serviceBlue12Bold,
      textAlign: TextAlign.end,
    );
  }
}

final List<Testimonial> allTestimonials = const [
  const Testimonial(
      name: "Josh Y.",
      services: [Service.appDevelopment],
      assetName: "assets/images/josh-york.jpg",
      company: "Dym.dev",
      position: "Founder",
      text: "Tariq did an excellent job developing an app for us. He was "
          "professional and a great communicator. I would hire him with no "
          "question for other projects."),
  const Testimonial(
      name: "Zakiyah A.",
      services: [Service.uiDesign],
      assetName: "assets/images/zakiyah-acosta.jpg",
      company: "Zakiyah & Co.",
      position: "Founder",
      text: "I highly recommend Tariq if you're looking for a designer who "
          "really knows what they're doing and doesn't mind including you "
          "throughout the process so you'll know (and be able to see) what's going "
          "on every step of the way."),
];

class Testimonial {
  final String name;
  final List<Service> services;
  final String position;
  final String company;
  final String assetName;
  final String text;

  const Testimonial(
      {@required this.name,
      @required this.services,
      @required this.position,
      @required this.company,
      @required this.assetName,
      @required this.text});
}

enum Service {
  uiDesign,
  appDevelopment,
  webDevelopment,
}
