import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zag_nights/presentation/login_screen/view/login_screen_view.dart';
import 'package:zag_nights/presentation/sign_up/view/sign_up_page.dart';
import 'package:zag_nights/presentation/splash_screen/view/widgets/splash_body.dart';
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
  static const String mainLayoutRoute = "/MainLayout";
}

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) =>const SplashViewBody());

      case Routes.loginRoute:
        initLoginUseCase();

        return MaterialPageRoute(builder: (_) =>const LoginScreen());

      case Routes.registerRoute:
        initLoginUseCase();

        return MaterialPageRoute(builder: (_) =>const SignUpPage());

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