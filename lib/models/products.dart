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
    summary: "Alosha is an iOS and Android application that focuses on helping "
        "new and upcoming artists with getting exposure and money quicker for "
        "their creative efforts by providing a place to expose their artwork "
        "to prospective buyers. Serving, painters, musicians, and sculptors "
        "alike.",
    detail: "Alosha is an iOS and Android application that focuses on helping "
        "new and upcoming artists with getting exposure and money quicker for "
        "their creative efforts by providing a place to expose their artwork "
        "to prospective buyers. Serving, painters, musicians, and sculptors "
        "alike. I worked with the founder of this platform to design and develop "
        "this product. Walking with him through the entire process of bringing "
        "his ideas to life and delivering the app to the market. We now have "
        "an ongoing relationship and are looking forward to expanding the "
        "product to the web later this year as a web application.",
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
    summary: "Boss Cuts is a Barber Shop based in New Zealand specializing in "
        "boutique hair cuts. To improve the prestige of their brand the client "
        "wanted to create a native mobile experience for both Android and iOS. "
        "With a mobile app for their business they were able to separate "
        "themselves from other Barbershops as a high end Hair Boutique.",
    detail: "Boss Cuts is a Barber Shop based in New Zealand specializing in "
        "boutique hair cuts. To improve the prestige of their brand the client "
        "wanted to create a native mobile experience for both Android and iOS. "
        "Having a mobile app for their business they were able to separate "
        "themselves from other Barbershops as a high end Hair Boutique. The "
        "client came with designs for how the app should look, so I developed "
        "the app per their specification and launched the iOS and Android apps "
        "to their respective stores over the span of 6 weeks.",
  ),
  Product(
    name: "Companions Forever",
    services: [Service.uiDesign, Service.appDevelopment],
    color: Color(0xFF36AAD0),
    iconBackgroundColor: Colors.white,
    assetIconName: "assets/images/companions-forever-icon.png",
    deviceArt: [
      "assets/images/companions-forever-login.png",
      "assets/images/companions-forever-notifications.png",
      "assets/images/companions-forever-rewards.png",
      "assets/images/companions-forever-rewards-history.png",
      "assets/images/companions-forever-schedule.png",
      "assets/images/companions-forever-shifts.png",
    ],
    summary: "Companions Forever is a home care services provider based in "
        "Greater Hartford and New Haven counties of Connecticut. To improve "
        "the value of their services they wanted a mobile app created for "
        "their caregivers and customers.",
    detail: "Companions Forever is a home care services provider based in "
        "Greater Hartford and New Haven counties of Connecticut. To improve "
        "the value of their services they wanted a mobile app created for "
        "their caregivers and customers. Working with the company we were able "
        "to design and develop an app that allows their caregivers to set "
        "their hours and track their wages; and give their customers the "
        "easy capability of setting the plan of care for their loved ones.",
  ),
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
    summary: "The Cultural Exchange Shop is a successful online store that "
        "focuses on unique items that you can't quite find anywhere else. They "
        "wanted to do a rebuild, and redesign of the platform, as they prepare "
        "to scale their business to a broader market.",
    detail: "The Cultural Exchange Shop is a successful online store that "
        "focuses on unique items that you can't quite find anywhere else. They "
        "wanted to do a rebuild, and redesign of the platform, as they prepare "
        "to scale their business to a broader market. Working hand-in-hand "
        "with the owner overhauled the look of their e-commerce website, and "
        "optimized the shipping process using a new and improved admin "
        "dashboard.",
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
