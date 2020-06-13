import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:flutter/material.dart';

class SendSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: kElevationToShadow[4],
                ),
                child: Image.asset("assets/images/send-large-blue.png")),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("Inquiry Sent", style: titleWhite24),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text("I'll be in touch within the next 24 hours",
                style: white16Medium),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SquaredButton(
              textStyle: white20Medium,
              backgroundColor: aOrange,
              text: "OK 👌",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
