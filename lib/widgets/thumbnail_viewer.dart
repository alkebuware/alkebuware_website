import 'package:alkebuware_website/main.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:alkebuware_website/colors.dart';

class ThumbnailViewer extends StatelessWidget {
  final List<String> assetPaths;

  const ThumbnailViewer({Key key, @required this.assetPaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: backgroundGray, borderRadius: BorderRadius.circular(8)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for (String path in assetPaths)
            GestureDetector(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return Material(
                      color: Colors.transparent,
                      child: Stack(
                        children: <Widget>[
                          PhotoView(
                            imageProvider: AssetImage(path),
                            initialScale:
                                PhotoViewComputedScale.contained * 0.7,
                            backgroundDecoration:
                                BoxDecoration(color: Colors.transparent),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: IconButton(
                                  icon: Image.asset("assets/images/close.png"),
                                  onPressed: () {
                                    final appState = AppState.of(context);
                                    appState.rootNavigatorState.pop();
                                  }),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: kElevationToShadow[2],
                      image: DecorationImage(
                        image: AssetImage(path),
                        fit: BoxFit.cover,
                      ))),
            )
        ],
      ),
    );
  }
}
