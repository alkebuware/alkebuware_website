import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/container.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutPage extends StatelessWidget {
  static final String routeName = "/about";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AContainer(
        child: ScreenTypeLayout(
          mobile:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Picture(),
            _Introduction(),
            _Summary(),
          ]),
          desktop: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _Picture(),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Introduction(),
                    _Summary(),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: AContainer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Personal Approach", style: titleADarkBlue24Bold),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Most agencies and technical consultants will, unfortunately, "
                "treat you like a number. Just another app that needs to be "
                "built and launched. When working with me, however, you’ll get "
                "a much more personal approach when launching your product. We "
                "will both work hand-in-hand to create your vision, and meet "
                "your business needs.",
                style: aDarkBlue16Medium,
              ),
            )
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: AContainer(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Research Driven", style: titleADarkBlue24Bold),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                "Whenever I work with other professionals to deliver products "
                    "I learn a lot about the business case, and the problem that "
                    "their product solves. Consequently, we’ll learn a lot from "
                    "each other on our way delivering a world class product.",
                style: aDarkBlue16Medium,
              ),
            )
          ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          children: <Widget>[
            Text("My Clients", style: titleADarkBlue24Bold),
            Testimonials(),
          ],
        ),
      ),
      Footer(),
    ]);
  }
}

class _Picture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/professional.png"),
      ],
    );
  }
}

class _Introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
      child: Text(
        "Hello There! My name is Tariq.",
        style: titleADarkBlue24Bold,
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "I'm a North Carolina A&T State "
          "University Alum and the owner of ALKEBUWARE. I'm a Full-Stack "
          "software engineer with a passion for developing elegant user "
          "interfaces and robust backends. I'm fully committed to helping you go "
          "from idea to product launch. I have designed, developed, and deployed "
          "multiple software products and have experience with a number of "
          "different Back-End as a Service platforms. In addition to my software "
          "development exploits I've also created mock-ups and user interaction "
          "diagrams for a number of applications that I've built from the ground "
          "up. Having a background in embedded software systems enables me to "
          "take a holistic approach to the software solutions provide.\n\n"
          "I will work together with you to build compelling apps that provide "
          "lasting excitement and value to their customers. My understanding of "
          "mobile and web based technology empowers me to bring a level of "
          "expertise to your company like no one else. I know how to build "
          "products that can scale to your business' needs, regardless if you're "
          "a startup or an established company.",
      style: aDarkBlue16Medium,
    );
  }
}
