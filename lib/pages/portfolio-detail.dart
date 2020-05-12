import 'package:alkebuware_website/main.dart';
import 'package:alkebuware_website/utils/get_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PortfolioDetailPage extends StatefulWidget {
  static String routeName(String id) => "/portfolio/$id";

  @override
  _PortfolioDetailPageState createState() => _PortfolioDetailPageState();
}

class _PortfolioDetailPageState extends State<PortfolioDetailPage> {
  @override
  Widget build(BuildContext context) {
    final appState = AppState.of(context);
    final id = getId(context);
    if (id == null) {
      Future.delayed(Duration(), () => appState.appBarNavigatorState.pop());
      return Container();
    }

    return Center(child: Text("ProductDetail $id"));
  }
}
