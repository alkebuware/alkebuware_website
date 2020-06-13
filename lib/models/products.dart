import 'package:flutter/material.dart';

import 'testimonials.dart';

final List<Product> allProducts = [
  Product(
    name: "Alosha",
    services: [
      Service.uiDesign,
      Service.webDevelopment,
      Service.appDevelopment
    ],
    color: Color(0xFF4181D1),
    assetIconName: "assets/images/alosha-icon.png",
    deviceArt: [
      "assets/images/alosha-home.png",
      "assets/images/alosha-product-detail.png",
      "assets/images/alosha-profile-artwork.png",
      "assets/images/alosha-profile-activity.png",
      "assets/images/alosha-share-questionnaire.png",
      "assets/images/alosha-share-success.png",
      "assets/images/alosha-sign-up.png",
    ],
    summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ",
    detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ni"
        "sl eros, ut ultrices magna pharetra nec. Mauris massa nisl, viverra ve"
        "l condimentum id, tincidunt nec magna. Nullam ut semper nisi. Nulla vi"
        "verra est sagittis odio cursus egestas. Quisque imperdiet purus est, e"
        "get tempus ante molestie non. Maecenas quis dignissim est. Sed hendrer"
        "it purus eu nulla facilisis tristique. Nulla massa neque, cursus susci"
        "pit luctus vel, efficitur ut diam. Mauris molestie ligula a lacus elei"
        "fend, sit amet vestibulum libero porttitor.",
    websiteUrl: "https://www.alosha.net",
  ),
  Product(
    name: "Boss Cuts",
    services: [Service.appDevelopment],
    color: Color(0xFF101010),
    assetIconName: "assets/images/boss-cuts-icon.png",
    deviceArt: [
      "assets/images/boss-cuts-home.png",
      "assets/images/boss-cuts-login.png",
      "assets/images/boss-cuts-location.png",
      "assets/images/boss-cuts-products.png",
      "assets/images/boss-cuts-styles.png",
    ],
    summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ",
    detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ni"
        "sl eros, ut ultrices magna pharetra nec. Mauris massa nisl, viverra ve"
        "l condimentum id, tincidunt nec magna. Nullam ut semper nisi. Nulla vi"
        "verra est sagittis odio cursus egestas. Quisque imperdiet purus est, e"
        "get tempus ante molestie non. Maecenas quis dignissim est. Sed hendrer"
        "it purus eu nulla facilisis tristique. Nulla massa neque, cursus susci"
        "pit luctus vel, efficitur ut diam. Mauris molestie ligula a lacus elei"
        "fend, sit amet vestibulum libero porttitor.",
  ),
//  Product(
//    name: "Companions Forever",
//    services: [Service.uiDesign, Service.appDevelopment],
//    color: Color(0xFF36AAD0),
//    iconBackgroundColor: Colors.white,
//    assetIconName: "assets/images/companions-forever-icon.png",
//    summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
//        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
//        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ",
//    detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
//        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
//        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ni"
//        "sl eros, ut ultrices magna pharetra nec. Mauris massa nisl, viverra ve"
//        "l condimentum id, tincidunt nec magna. Nullam ut semper nisi. Nulla vi"
//        "verra est sagittis odio cursus egestas. Quisque imperdiet purus est, e"
//        "get tempus ante molestie non. Maecenas quis dignissim est. Sed hendrer"
//        "it purus eu nulla facilisis tristique. Nulla massa neque, cursus susci"
//        "pit luctus vel, efficitur ut diam. Mauris molestie ligula a lacus elei"
//        "fend, sit amet vestibulum libero porttitor.",
//  ),
  Product(
    name: "The Cultural Exchange Shop",
    services: [
      Service.uiDesign,
      Service.webDevelopment,
    ],
    color: Color(0xFF101010),
    assetIconName: "assets/images/tce-shop-icon.png",
    deviceArt: [
      "assets/images/tceshop-product-detail.png",
      "assets/images/tceshop-category.png",
      "assets/images/tceshop-checkout-payment-method.png",
      "assets/images/tceshop-checkout-shipping-method.png",
      "assets/images/tceshop-dashboard-home.png",
      "assets/images/tceshop-dashboard-product-detail.png",
      "assets/images/tceshop-product-detail-desktop.png",
      "assets/images/tceshop-search-desktop.png",
    ],
    summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ",
    detail: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut "
        "sollicitudin eleifend lacus, et pretium elit varius ut. Aenean gravida"
        " facilisis sem, nec tristique ipsum finibus sed. Mauris consectetur ni"
        "sl eros, ut ultrices magna pharetra nec. Mauris massa nisl, viverra ve"
        "l condimentum id, tincidunt nec magna. Nullam ut semper nisi. Nulla vi"
        "verra est sagittis odio cursus egestas. Quisque imperdiet purus est, e"
        "get tempus ante molestie non. Maecenas quis dignissim est. Sed hendrer"
        "it purus eu nulla facilisis tristique. Nulla massa neque, cursus susci"
        "pit luctus vel, efficitur ut diam. Mauris molestie ligula a lacus elei"
        "fend, sit amet vestibulum libero porttitor.",
  ),
];

class Product {
  final String assetIconName;
  final Color color;
  final List<Service> services;
  final String name;
  final String summary;
  final String detail;
  final String websiteUrl;
  final Color iconBackgroundColor;
  final List<String> deviceArt;

  Product({@required this.deviceArt,
    this.websiteUrl,
      @required this.color,
      @required this.assetIconName,
      @required this.services,
      @required this.name,
      @required this.summary,
      @required this.detail,
      this.iconBackgroundColor});
}