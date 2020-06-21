import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/models/testimonials.dart';
import 'package:alkebuware_website/text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'services.dart';

class Testimonials extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _Mobile(),
      tablet: _Mobile(),
      desktop: _Desktop(),
    );
  }
}

class _Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: allTestimonials
          .map((t) => Flexible(child: TestimonialCard(testimonial: t)))
          .toList(),
    );
  }
}

class _Mobile extends StatefulWidget {
  @override
  __MobileState createState() => __MobileState();
}

class __MobileState extends State<_Mobile> {
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
          constraints: BoxConstraints(maxHeight: 350, maxWidth: 500),
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
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TestimonialContent(testimonial: testimonial),
      ),
    );
  }
}

class TestimonialContent extends StatelessWidget {
  final Testimonial testimonial;

  const TestimonialContent({Key key, this.testimonial}) : super(key: key);

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
                ServiceIcons(
                  services: testimonial.services,
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
