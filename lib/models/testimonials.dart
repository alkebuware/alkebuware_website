import 'package:meta/meta.dart';

final List<Testimonial> allTestimonials = const [
  const Testimonial(
      name: "Ben D.",
      services: [Service.webDevelopment, Service.appDevelopment],
      assetName: "assets/images/ben-depew.png",
      company: "ROAD iD",
      position: "Director of IT",
      text: "Tariq crushed this project. Fantastic Developer. In addition to "
          "his strong developer chops, he's also a great communicator. He's "
          "organized, moves fast, communicates early and often. I plan to hire "
          "him for all of my mobile development needs moving forward."),
  const Testimonial(
      name: "Nephi H.",
      services: [Service.uiDesign, Service.appDevelopment, Service.windowsDevelopment],
      assetName: "assets/images/nephi-harvey.jpeg",
      company: "Fort Supply Technologies, LLC",
      position: "CTO",
      text: "Tariq has worked with Fort Supply Technologies, LLC as a contract "
          "developer since March 2021 to develop novel solutions for the "
          "animal food safety industry.  His skills have proven exceptional in "
          "figuring out how to implement software solutions for our essential "
          "industry in difficult times.  He is an excellent communicator from "
          "design to deployment using Flutter and other related development "
          "tools. When presented with roadblocks he focuses on quickly and "
          "efficiently implementing permanent solutions.  I would recommend "
          "Tariq for anyone needing to explore, design and implement mobile "
          "software solutions."),
  const Testimonial(
      name: "Jordan P.",
      services: [Service.uiDesign, Service.appDevelopment],
      assetName: "assets/images/jordan-poulsen.jpg",
      company: "DECK",
      position: "Founder",
      text: "Tariq was amazing to work with. He really knows what he is "
          "talking about and was great at explaining things to me, someone who "
          "really knows nothing about all this. He was always able to provide "
          "solutions to problems that might have come up and provide "
          "suggestions when I had certain requests. He communicated with me on "
          "a regular basis and I was always aware of how things were "
          "progressing. I would love to work with Tariq again in the future "
          "and would recommend him to anyone looking for app development "
          "services."),
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
  windowsDevelopment
}
