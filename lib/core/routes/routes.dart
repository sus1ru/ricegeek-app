import 'package:flutter/material.dart';
import 'package:rice_geek/pages/auth/landing_page.dart';
import 'package:rice_geek/pages/home.dart';
import 'package:rice_geek/models/image_select.dart';
import 'package:rice_geek/pages/onboarding.dart';
import 'package:rice_geek/pages/profile_page.dart';
import 'package:rice_geek/pages/disease_about.dart';

class Routes {
  static const landingPage = "/";
  static const home = "/home";
  // static const imageSelect = "/imageSelect";
  static const profile = "/profile";
  static const diseaseAbout = "/diseaseAbout";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landingPage:
        return MaterialPageRoute(
          builder: ((context) => const LandingPage()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: ((context) => const ProfilePage()),
        );
      case Routes.diseaseAbout:
        return MaterialPageRoute(
          builder: ((context) => const DiseaseAbout()),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomeScreen()),
        );
    }
  }
}
