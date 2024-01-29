import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/auth/forget_password.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/auth/sign_in.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/auth/sign_up.dart';
import 'package:save_favorite_posts/save_favorite_posts/presentation/ui/onboarding/onboarding_view.dart';
import '../ui/home_view/home_view.dart';
import 'arguments.dart';
class Routes {
  static const String homeRoute = "/home";
  static const String onBoarding = "/onBoarding";
  static const String signIn = "/signIn";
  static const String signOut = "/signOut";
  static const String forgotPass = "/forgotPass";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignInView());
      case Routes.signOut:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case Routes.forgotPass:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
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
