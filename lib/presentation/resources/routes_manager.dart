import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zag_nights/presentation/login_screen/view/login_screen_view.dart';
import 'package:zag_nights/presentation/mainlayout_screen.dart';
import 'package:zag_nights/presentation/onboarding_screen/view/onBoardingView.dart';
import 'package:zag_nights/presentation/selection_screen/view/selection_view.dart';
import 'package:zag_nights/presentation/splash_screen/view/splash_view.dart';
import '../../app/sl.dart';

import '../common/animation/animation.dart';
import '../register_screen/view/sign_up_page.dart';
import 'strings_manager.dart';

class Routes {
  Routes._();

  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
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
        initGetSignedUserUseCase();
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingRoute:
        return goTo(const OnBoardingScreen());
      case Routes.selectionRoute:
        return MaterialPageRoute(builder: (_) => const SelectionScreen());
      case Routes.loginRoute:
        initLoginUseCase();
        initPasswordResetUseCase();
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const LoginScreen(),
        );

      case Routes.registerRoute:
        initRegisterUseCase();
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const MainLayOut());

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
