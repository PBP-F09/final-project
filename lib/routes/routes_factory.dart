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
        return const TanyaBundPage();
      case RoutesName.diaryBund:
        return const DiaryBundPage();
      case RoutesName.diaryBundForm:
        return const DiaryForm();
      // Add your page here
      case RoutesName.bacaBund:
        return const BacaBundPage();
      default:
        return const OnboardingPage();
    }
  }
}
