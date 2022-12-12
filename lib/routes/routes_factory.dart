import 'package:endterm_project/views/pages/authentication/_authentication.dart';
import 'package:endterm_project/views/pages/onboarding/_onboarding.dart';
import 'package:flutter/material.dart';
import '../views/pages/_pages.dart';
import 'routes_name.dart';

Widget getScreenByName(String name) {
  {
    switch (name) {
      case RoutesName.home:
        return const HomePage();
      case RoutesName.signup:
        return const SignUpPage();
      case RoutesName.login:
        return const LoginPage();
      case RoutesName.tanyaBund:
        return TanyaBundPage();
      case RoutesName.catatBund:
        return const CatatBundPage();
      case RoutesName.catatBundForm:
        return const CatatForm();
      // Add your page here
      case RoutesName.bacaBund:
        return const BacaBundPage();
      case RoutesName.periksaBund:
        return const PeriksaBundPage();
      default:
        return const OnboardingPage();
    }
  }
}
