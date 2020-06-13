import 'package:alkebuware_website/colors.dart';
import 'package:alkebuware_website/dimensions.dart';
import 'package:alkebuware_website/text.dart';
import 'package:alkebuware_website/widgets/footer.dart';
import 'package:alkebuware_website/widgets/page_view.dart';
import 'package:alkebuware_website/widgets/rounded_button.dart';
import 'package:alkebuware_website/widgets/squared_button.dart';
import 'package:alkebuware_website/widgets/testimonials.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  static final String routeName = "/";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Stack(
        children: [
          Container(
            color: aDarkBlue,
            width: getScreenWidth(context),
            height: 700,
          ),
          Image.asset("assets/images/home-background.png",
              height: 1000, width: getScreenWidth(context), fit: BoxFit.cover),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 64),
              child: Container(
                  width: 1000,
                  height: 1000,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [Color(0x00FFFFFF), Color(0x0DFFFFFF)],
                      stops: [0, 1],
                    ),
                  )),
            ),
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 32, left: 16, right: 16, bottom: 16),
                child: Text(
                  "Let's build something amazing",
                  style: titleWhite42Bold,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Text(
                    "Together you and I will build a compelling app that'll keep your customers coming back for more.",
                    style: white24,
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: SquaredButton(
                  text: "HIRE ME! 😁",
                  textStyle: white20Medium,
                  backgroundColor: aOrange,
                  // TODO: implement onTap when hire-me dialog ready
                  onTap: () {},
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Image.asset("assets/images/alosha-discover.png"),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("My Work", style: titleADarkBlue24Bold),
                    InkWell(
                      // TODO: Navigate to portfolio when ready
                      onTap: () {},
                      child: Row(children: [
                        Text("View portfolio", style: aLightBlue16),
                        Icon(
                          Icons.chevron_right,
                          color: aLightBlue,
                        )
                      ]),
                    )
                  ],
                ),
              ),
              ProductPageView(assetPaths: [
                "assets/images/boss-cuts-home.png",
                "assets/images/tceshop-product-detail.png",
                "assets/images/alosha-profile.png"
              ]),
              Padding(
                  padding: const EdgeInsets.only(top: 64),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("My Clients", style: titleADarkBlue24Bold),
                            RoundedButton(
                                backgroundColor: aOrange,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: 16.0),
                                        child: Text("Hire me", style: white24),
                                      ),
                                      Icon(
                                        Icons.chevron_right,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Testimonials(),
                    ],
                  )),
              Footer(),
            ],
          ),
        ],
      ),
    );
  }
}
