import 'package:flutter/material.dart';
import '../views/pages/_pages.dart';
import 'routes_name.dart';

Widget getScreenByName(String name) {
  {
    switch (name) {
      case RoutesName.home:
        return const HomePage();
      case RoutesName.tanyaBund:
        return const TanyaBundPage();
      // Add your page here
      default:
        return const HomePage();
    }
  }
}
