import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/pages/resume.dart';
import 'package:alkebuware_website/widgets/current_route_builder.dart';
import 'package:alkebuware_website/widgets/scrollbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_bar.dart';
import 'fab.dart';

class APage extends StatefulWidget {
  final Widget child;

  const APage({Key key, this.child}) : super(key: key);

  @override
  _APageState createState() => _APageState();
}

class _APageState extends State<APage> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(),
      backgroundColor: backgroundGray,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: CurrentRouteBuilder(builder: (context, routeName) {
        Widget child;
        if (routeName == ResumePage.routeName) {
          child = Column(children: [
            AFab(
                onPressed: () {
                  if (kIsWeb) {
                    launch("/resume.pdf");
                  } else {
                    print("can't show pdf in non-web");
                  }
                },
                backgroundColor: aOrange,
                child: Image.asset("assets/images/download.png")),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: AFab(
                  onPressed: () {
                    launch(
                        "https://www.linkedin.com/in/tariq-alkebu-lan-86670245/");
                  },
                  backgroundColor: linkedInBlue,
                  child: Image.asset("assets/images/linkedin.png")),
            ),
          ]);
        } else {
          child = Container();
        }

        return Padding(padding: EdgeInsets.only(top: 96), child: child);
      }),
      body: AScrollBar(
          child: SingleChildScrollView(
              controller: _controller, child: widget.child),
          controller: _controller),
    );
  }
}
