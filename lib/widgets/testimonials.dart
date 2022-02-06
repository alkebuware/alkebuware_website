import 'dart:math';

import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/models/testimonials.dart';
import 'package:alkebuware_website/pages/testimonial_dialog.dart';
import 'package:alkebuware_website/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'services.dart';

class Testimonials extends StatelessWidget {
  final int limit;

  const Testimonials({Key key, this.limit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: _Mobile(),
      tablet: _Mobile(),
      desktop: _Desktop(limit: limit),
    );
  }
}

class _Desktop extends StatelessWidget {
  final int limit;

  const _Desktop({Key key, this.limit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = List.generate(3, (index) => <Widget>[]);
    int i = 0;
    for (final testimonial
        in allTestimonials.take(limit ?? allTestimonials.length)) {
      columns[i++ % 3].add(Flexible(
          child: TestimonialCard(testimonial: testimonial, shrinkWrap: true)));
    }
    return Container(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columns
            .map((children) => Flexible(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: children)))
            .toList(),
      ),
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
          constraints: BoxConstraints(maxHeight: 400, maxWidth: 500),
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
  final bool shrinkWrap;

  const TestimonialCard(
      {Key key, @required this.testimonial, this.shrinkWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TestimonialContent(
            testimonial: testimonial, shrinkWrap: shrinkWrap),
      ),
    );
  }
}

class TestimonialContent extends StatelessWidget {
  final Testimonial testimonial;
  final bool shrinkWrap;

  const TestimonialContent({Key key, this.testimonial, this.shrinkWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget text = Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: AutoSizeText(
        testimonial.text,
        overflowReplacement:
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Expanded(
              child: Text(testimonial.text,
                  overflow: TextOverflow.fade, style: aDarkBlue16)),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: TextButton(
                onPressed: () => router.navigateTo(
                    context,
                    TestimonialDialog.routeName(
                        allTestimonials.indexOf(testimonial).toString())),
                child: Text("See the rest", style: aLightBlue16Medium)),
          )
        ]),
        minFontSize: aDarkBlue16.fontSize,
        style: aDarkBlue16,
        textAlign: TextAlign.left,
      ),
    );
    if (shrinkWrap) {
      text = Flexible(child: text);
    } else {
      text = Expanded(child: text);
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
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
            Flexible(
              child: Column(
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
            ),
          ],
        ),
        text,
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
