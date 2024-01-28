import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ui/home_view/home_view.dart';
import 'arguments.dart';
class Routes {
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      // case Routes.pdfRoute:
      //   return MaterialPageRoute(builder: (_) => PDFView(arguments: settings.arguments as GoToPage));
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
