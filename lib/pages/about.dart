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
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum",
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
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
                "Lorem ipsum Lorem ipsum Lorem ipsum",
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
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
          child: Text(
            "Hey There, My Name is Tariq!",
            style: titleADarkBlue24Bold,
          ),
        )
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
        "Hey There, My Name is Tariq!",
        style: titleADarkBlue24Bold,
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
          "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum "
          "Lorem ipsum Lorem ipsum Lorem ipsum",
      style: aDarkBlue16Medium,
    );
  }
}
