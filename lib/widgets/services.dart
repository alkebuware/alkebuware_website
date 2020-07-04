import 'package:alkebuware_website/models/testimonials.dart';
import 'package:alkebuware_website/text.dart';
import 'package:flutter/material.dart';

class ServiceIcons extends StatelessWidget {
  final List<Service> services;
  final MainAxisAlignment mainAxisAlignment;

  const ServiceIcons(
      {Key key,
      @required this.services,
      this.mainAxisAlignment = MainAxisAlignment.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: services.map((s) {
        final bool isMiddle = services.last != s && services.first != s;
        Image image;
        switch (s) {
          case Service.uiDesign:
            image = Image.asset("assets/images/ui-design.png");
            break;
          case Service.appDevelopment:
            image = Image.asset("assets/images/app-development.png");
            break;
          case Service.webDevelopment:
            image = Image.asset("assets/images/web-development.png");
            break;
        }

        if (image != null) {
          return Padding(
            padding: isMiddle
                ? EdgeInsets.symmetric(horizontal: 8)
                : EdgeInsets.all(0),
            child: image,
          );
        } else {
          return Container();
        }
      }).toList(),
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
