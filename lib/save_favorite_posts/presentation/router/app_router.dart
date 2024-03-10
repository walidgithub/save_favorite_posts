import 'package:flutter/material.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/landing/landing_view.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/onboarding/onboarding_view.dart';
class Routes {
  static const String onBoarding = "/onBoarding";
  static const String landing = "/landing";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.landing:
        return MaterialPageRoute(builder: (_) => const LandingView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Container()),
            );
  }
}
