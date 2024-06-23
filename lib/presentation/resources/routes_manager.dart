import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zag_nights/presentation/splash_screen/view/splash_view.dart';
import '../../app/sl.dart';

import 'strings_manager.dart';

class Routes {
  Routes._();

  static const String splashRoute = "/";
  static const String onboadingRoute = "/onboarding";
  static const String selectionRoute = "/selection";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>const SplashView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound.tr()),
        ),
        body: Center(child: Text(AppStrings.noRouteFound.tr())),
      ),
    );
  }
}
