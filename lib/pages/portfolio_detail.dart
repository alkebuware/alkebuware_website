import 'package:alkebuware_website/models/products.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/container.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/page_view.dart';
import 'package:alkebuware_website/widgets/services.dart';
import 'package:flutter/material.dart';

class PortfolioDetailPage extends StatelessWidget {
  PortfolioDetailPage({required this.id});

  final int id;

  static String routeName(String id) => "/portfolio/$id";

  @override
  Widget build(BuildContext context) {
    final product = allProducts[id];

    return Column(
      children: <Widget>[
        AContainer(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(product.name, style: titleADarkBlue24Bold),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ServiceIcons(
              services: product.services,
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ServiceText(services: product.services),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: SelectableText(product.detail, style: aDarkBlue16),
          )
        ])),
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
          child: ProductPageView(
            assetPaths: product.deviceArt,
          ),
        ),
        Footer()
      ],
    );
  }
}
