import 'package:flutter/material.dart';

double getScreenHeight(context) => MediaQuery.of(context).size.height;

double getScreenWidth(context) => MediaQuery.of(context).size.width;

double getStatusBarHeight(context) => MediaQuery.of(context).padding.top;
