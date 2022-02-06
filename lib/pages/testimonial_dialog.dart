import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/models/testimonials.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/dialog.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
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
    return ADialog(
      title: "${testimonial.name}'s testimonial",
      backgroundColor: Colors.white,
      titleTextStyle: titleADarkBlue36Bold,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: TestimonialContent(
            testimonial: testimonial,
            shrinkWrap: true
        ),
      ),
    );
  }
}
