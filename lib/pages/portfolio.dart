import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/models/products.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/services.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'portfolio_detail.dart';

class PortfolioPage extends StatelessWidget {
  static final String routeName = "/portfolio";

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ScreenTypeLayout(
        mobile: _PortfolioPage(columnCount: 1),
        tablet: _PortfolioPage(columnCount: 2),
        desktop: _PortfolioPage(columnCount: 2),
      ),
      Footer()
    ]);
  }
}

class _PortfolioPage extends StatelessWidget {
  final int columnCount;

  const _PortfolioPage({Key key, this.columnCount = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = List.generate(columnCount, (index) => <Widget>[]);
    int i = 0;
    for (final p in allProducts) {
      columns[i++ % columnCount].add(ProductCard(product: p));
    }
    return Container(
      constraints: BoxConstraints(maxWidth: 1024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: columns
            .map((children) => Flexible(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: children)))
            .toList(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: product.iconBackgroundGradient,
                      color: product.iconBackgroundGradient == null
                          ? product.iconBackgroundColor ?? product.color
                          : null,
                      boxShadow: [
                        BoxShadow(
                            color: product.color,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                            spreadRadius: 0)
                      ]),
                  child: ClipOval(
                    child: Padding(
                      padding: product.iconPadding,
                      child: Image.asset(
                        product.assetIconName,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ServiceIcons(
                        services: product.services,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: ServiceText(services: product.services),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                product.name,
                style: titleADarkBlue24Bold,
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                product.summary,
                style: aDarkBlue16,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Column(
                    children: <Widget>[
                      if (product.websiteUrl != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TextButton(
                              child: Text("View App Website",
                                  style: aDarkBlue20Medium),
                              onPressed: () async {
                                if (await canLaunch(product.websiteUrl)) {
                                  launch(product.websiteUrl);
                                }
                              }),
                        ),
                      SquaredButton(
                        textStyle: white20Medium,
                        backgroundColor: aOrange,
                        text: "View Details",
                        onTap: () {
                          router.navigateTo(
                              context,
                              PortfolioDetailPage.routeName(
                                  allProducts.indexOf(product).toString()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
