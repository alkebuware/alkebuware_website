import 'package:flutter/material.dart';

import 'testimonials.dart';

final List<Product> allProducts = [
  Product(
      name: "ROAD iD",
      services: [Service.webDevelopment, Service.appDevelopment],
      color: Color(0xFFF05842),
      assetIconName: "assets/images/road-id-icon.png",
      deviceArt: [
        "assets/images/road-id-home.png",
        "assets/images/road-id-activity-in-progress.png",
        "assets/images/road-id-sos-countdown.png",
        "assets/images/road-id-activity-paused.png",
        "assets/images/road-id-activity-finished.png",
        "assets/images/road-id-guardian.png",
        "assets/images/road-id-paywall.png",
        "assets/images/road-id-history.png",
        "assets/images/road-id-splash.png",
      ],
      summary: "The ROAD iD app is a mobile app that gives runners, cyclists, "
          "hikers, or just about anyone else that enjoys the outdoors peace of "
          "of mind while they are on their adventure. Athletes using the ROAD "
          "iD can select individuals to follow their ride (Guardians)."
          "Their Guardians will receive texts and or emails with alerts and "
          "updates to monitor the athlete's progress in real time.",
      detail: "The ROAD iD app is a mobile app that gives runners, cyclists, "
          "hikers, or just about anyone else that enjoys the outdoors peace of "
          "of mind while they are on their adventure. Athletes using the ROAD "
          "iD can select individuals to follow their ride (Guardians)."
          "Their Guardians will receive texts and or emails with alerts and "
          "updates to monitor the athlete's progress in real time.\n\n"
          "REAL TIME LOCATION SHARING\n"
          "A brainlessly simple way to let your loved ones follow you on your "
          "adventures. The ROAD iD App sends eCrumbs (electronic breadcrumbs) to "
          "your selected loved ones (Guardians). eCrumbs can be sent via Email "
          "or SMS and give your Guardians the ability to see where you are, how "
          "far you’ve gone, and the route you’ve traveled. Guardians do NOT need "
          "to install the App to see your location.\n\n"
          "ACCIDENT SENSING\n"
          "Our patented Stationary Alert technology provides loved ones with "
          "your wipeout whereabouts. When activated, the ROAD iD App will "
          "trigger a Stationary Alert when it senses that you have been "
          "stationary for too long. You are given 30 seconds to dismiss the "
          "Stationary Alert before the App notifies your pre-selected loved ones "
          "(Guardians). Stationary Alerts can be sent via Email or SMS. "
          "Guardians do NOT need the App to receive Stationary Alerts.\n\n"
          "ONE-TOUCH SOS\n"
          "Instantly notify loved ones that you need help and call First "
          "Responders if needed. When using the App, simply press the SOS button "
          "and we'll notify your loved ones (Guardians) that you're in distress. "
          "Pressing this button will also give you a shortcut to call Emergency "
          "Services (ex. 911). This emergency screen will show your current "
          "Latitude and Longitude so you can tell First Responders exactly where "
          "you are.",
      websiteUrl: "https://www.roadid.com/pages/road-id-app-learn-more"),
  Product(
    name: "DECK",
    services: [Service.uiDesign, Service.appDevelopment],
    iconPadding: EdgeInsets.only(left: 16, right: 12, bottom: 12, top: 12),
    iconBackgroundGradient: LinearGradient(colors: [
      Color(0xFF0D5080),
      Color(0xFF000833),
    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
    color: Color(0xFF000833),
    assetIconName: "assets/images/deck-icon.png",
    deviceArt: [
      "assets/images/deck-home-visual.png",
      "assets/images/deck-home-text.png",
      "assets/images/deck-profile.png",
      "assets/images/deck-qr.png",
      "assets/images/deck-add-contact.png",
    ],
    summary: "How often have you thrown away somebody’s business card as soon "
        "as you get it? How often do you think someone throws away your "
        "business card? With Deck, sharing and storing business cards is "
        "easier than ever. Don’t worry about carrying around that paper card, "
        "just add it to Deck!",
    detail: "How often have you thrown away somebody’s business card as soon "
        "as you get it? How often do you think someone throws away your "
        "business card? With Deck, sharing and storing business cards is "
        "easier than ever. Don’t worry about carrying around that paper card, "
        "just add it to Deck! Premium Deck users can create their own profiles "
        "and easily share it with others via a personal QR code. Share your "
        "contact info on the go in seconds without worrying about whether or "
        "not they got your phone number right. Changing jobs or updating phone "
        "numbers? With a premium profile, other users who you’ve shared your "
        "profile with will immediately have your updated info and never be out "
        "of touch. Add links to your website and social media pages to drive "
        "potential customers to your products. If you want to gain, and more "
        "importantly retain, new customers and clients, then Deck is a must "
        "have app!\n\n"
        "• Scan in new business cards, make notes, and stay up to date with a "
        "client or colleague's most recent contact info.\n"
        "• Create your own profile and easily share it with others via your "
        "own personal QR code. Sharing your information with a new business "
        "contact is easier than ever.\n"
        "• New contact info such as phone numbers and emails are synced to "
        "other users that you’ve shared your profile with. Never lose contact "
        "with those important clients and potential customers!\n"
        "• Create a personal profile or a profile for a business.",
  ),
  Product(
    name: "Alosha",
    services: [
      Service.uiDesign,
      Service.webDevelopment,
      Service.appDevelopment
    ],
    color: Color(0xFF184998),
    iconBackgroundColor: Colors.white,
    assetIconName: "assets/images/alosha-icon.png",
    deviceArt: [
      "assets/images/alosha-home.png",
      "assets/images/alosha-sign-up.png",
      "assets/images/alosha-painting-detail.png",
      "assets/images/alosha-painting.png",
      "assets/images/alosha-music-detail.png",
      "assets/images/alosha-profile.png",
      "assets/images/alosha-checkout.png",
      "assets/images/alosha-share.png",
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
  ),
  Product(
    name: "VALUE TRACKER",
    services: [Service.uiDesign, Service.appDevelopment, Service.windowsDevelopment],
    color: Color(0xFF598527),
    assetIconName: "assets/images/value-tracker-icon.png",
    deviceArt: [
      "assets/images/value-tracker-scanners.png",
      "assets/images/value-tracker-intake.png",
      "assets/images/value-tracker-sync.png",
      "assets/images/value-tracker-form.png",
      "assets/images/value-tracker-form-overlay.png",
      "assets/images/value-tracker-login.png",
    ],
    summary: "VALUE TRACKER is a mobile app designed to easily document animal "
        "movements, streamline data collection when processing cattle chute "
        "side, and capture other data when working remotely. The Value Tracker "
        "App provides optimal wireless connectivity with other mobile devices "
        "such as ultra-high frequency (UHF) and/or low frequency (LF) "
        "electronic ID ear tag readers. Value Tracker enables you to collect "
        "individual animal data online or offline.",
    detail: "VALUE TRACKER is a mobile app designed to easily document animal "
        "movements, streamline data collection when processing cattle chute "
        "side, and capture other data when working remotely. The Value Tracker "
        "App provides optimal wireless connectivity with other mobile devices "
        "such as ultra-high frequency (UHF) and/or low frequency (LF) "
        "electronic ID ear tag readers. Value Tracker enables you to collect "
        "individual animal data online or offline.The data ‘Intake’ process "
        "minimizes hand data-entry by incorporating auto-populating fields, "
        "dropdown menus, and the option to repeat data in specific fields like "
        "‘Pasture/Pen’. Minimizing hand data-entry speeds up the data "
        "collection process and reduces human data-entry errors. Users can "
        "rearrange the data fields top to bottom to prioritize event-specific "
        "information and save that ‘Template’ for future use. User can also "
        "edit or delete individual animal records. Data is stored on the local "
        "device and can be exported when cell or internet connectivity is "
        "available.When finished, email the data file to yourself and/or "
        "others. Then upload the data into your current recordkeeping system. "
        "Contact Fort Supply Technologies to discuss other device connectivity "
        "and data management/analysis options.",
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
  final Gradient iconBackgroundGradient;
  final List<String> deviceArt;
  final EdgeInsets iconPadding;

  Product(
      {@required this.deviceArt,
      this.websiteUrl,
      this.iconPadding = const EdgeInsets.all(8),
      this.iconBackgroundGradient,
      @required this.color,
      @required this.assetIconName,
      @required this.services,
      @required this.name,
      @required this.summary,
      @required this.detail,
      this.iconBackgroundColor});
}
