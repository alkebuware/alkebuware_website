import 'package:flutter/material.dart';

int getId(BuildContext context) {
  try {
    final routeName = ModalRoute.of(context).settings.name;
    final index = int.tryParse(routeName.split("/").last);
    return index;
  } catch (e) {
    return null;
  }
}
