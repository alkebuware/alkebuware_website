import 'package:alkebuware_website/extensions/build_context.dart';
import 'package:alkebuware_website/models/testimonials.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/dialog.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
import 'package:flutter/material.dart';

class TestimonialDialog extends StatelessWidget {
  TestimonialDialog({required this.id});

  final int id;

  static String routeName(String id) => "/testimonial-details/$id";

  @override
  Widget build(BuildContext context) {
    Testimonial testimonial;
    try {
      testimonial = allTestimonials[id];
    } catch (e) {
      print(e);
      Future.delayed(Duration(), () {
        context.back();
      });
      return Container();
    }
    return ADialog(
      title: "${testimonial.name}'s testimonial",
      backgroundColor: Colors.white,
      titleTextStyle: titleADarkBlue36Bold,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: TestimonialContent(testimonial: testimonial, maxLines: null),
      ),
    );
  }
}
