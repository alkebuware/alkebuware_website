import 'package:meta/meta.dart';

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
  const Testimonial(
      name: "Sandeep P.",
      services: [Service.uiDesign, Service.appDevelopment],
      assetName: "assets/images/sandeep.jpeg",
      company: "CESC IP Holdings, LLC",
      position: "Software Application Developer",
      text: "I worked with Tariq on developing an app for us. He is a very "
          "good person with strong problem-solving skills, talented and a "
          "great communicator. I have had the pleasure of working with him and "
          "I'd highly recommend Tariq for any app development."),
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
