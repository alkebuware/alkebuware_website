import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

extension BuildContextX on BuildContext {
  GoRouter get router => GoRouter.of(this);

  List<String> get currentNavigationStack =>
      router.routerDelegate.currentConfiguration.matches
          .map((e) => e.matchedLocation)
          .toList();

  String get currentRoute => router.routeInformationProvider.value.uri.path;

  void back<T>([T? result]) {
    if (canPop()) {
      pop(result);
    } else {
      go("/");
    }
  }
}
