import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/models/testimonials.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestimonialDialog extends StatelessWidget {
  static String routeName(String id) => "/testimonial-details/$id";

  @override
  Widget build(BuildContext context) {
    Testimonial testimonial;
    try {
      final routeName = ModalRoute.of(context).settings.name;
      final index = int.tryParse(routeName.split("/").last);
      testimonial = allTestimonials[index];
    } catch (e) {
      print(e);
      Future.delayed(Duration(), () {
        Navigator.pop(context);
      });
      return Container();
    }
    return Container(
      height: getScreenHeight(context),
      width: getScreenWidth(context),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: getStatusBarHeight(context),
              bottom: 16,
              left: 16,
              right: 16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                      icon: Image.asset("assets/images/close-dark-blue.png"),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: TestimonialContent(
                  testimonial: testimonial,
                  maxLines: 10000,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String routeName;
  final String text;

  const NavigationButton(
      {Key key, @required this.routeName, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    return RoundedButton(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
      text: text,
      textStyle: titleWhite36Bold,
      backgroundColor: appState.currentRoute == routeName
          ? Colors.white12
          : Colors.transparent,
      onTap: () {
        Navigator.pop(context);
        appState.appBarNavigatorState
            .pushNamedAndRemoveUntil(routeName, (route) => false);
      },
    );
  }
}
