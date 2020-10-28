import 'package:flutter/material.dart';

class AContainer extends StatelessWidget {
  final Widget child;

  const AContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: kElevationToShadow[4],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 1024),
                      child: child),
                ),
              ],
            )),
      ],
    );
  }
}
