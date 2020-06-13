import 'package:alkebuware_website/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductPageView extends StatefulWidget {
  final List<String> assetPaths;

  const ProductPageView({Key key, this.assetPaths}) : super(key: key);

  @override
  _ProductPageViewState createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                PageController controller =
                    PageController(initialPage: _controller.page.round());
                return Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: <Widget>[
                      PhotoViewGallery.builder(
                          itemCount: widget.assetPaths.length,
                          scrollPhysics: BouncingScrollPhysics(),
                          pageController: controller,
                          backgroundDecoration:
                              BoxDecoration(color: Colors.transparent),
                          builder: (BuildContext context, int index) {
                            return PhotoViewGalleryPageOptions(
                                imageProvider:
                                    AssetImage(widget.assetPaths[index]),
                                initialScale:
                                    PhotoViewComputedScale.contained * 0.7);
                          }),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: IconButton(
                              icon: Image.asset("assets/images/close.png"),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Container(
          constraints: BoxConstraints(maxHeight: 600),
          child: PageView(
            controller: _controller,
            children: <Widget>[
              for (String path in widget.assetPaths) Image.asset(path)
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SmoothPageIndicator(
          controller: _controller,
          count: widget.assetPaths.length,
          effect: ExpandingDotsEffect(activeDotColor: aLightBlue),
        ),
      )
    ]);
  }
}
