import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:zag_nights/presentation/login_screen/view/login_screen_view.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/patient_screen/view/patient_screen.dart';
import 'package:zag_nights/presentation/selection_screen/view/selection_view.dart';
import 'package:zag_nights/presentation/splash_screen/view/splash_view.dart';
import '../../app/sl.dart';

import '../common/animation/animation.dart';
import '../doctor_mainlayout_screen/doctor_mainlayout_screen.dart';
import '../nures_mainlayout_screen/view/nurse_mainlayout_screen.dart';
import '../nures_mainlayout_screen/view/widgets/home_screen/view/nurse_home_screen.dart';
import '../nures_mainlayout_screen/view/widgets/search_screen/view/nurse_screen_body_search.dart';
import '../onboarding_screen/view/onBoardingView.dart';
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
  static const String nurseMainLayoutRoute = "/nurseMainLayout";
  static const String doctorMainLayoutRoute = "/doctorMainLayout";
  static const String nurseHomeScreenRoute = "/nurseHomeScreen";
  static const String patientScreenRoute = "/patientScreen";
  static const String patientSearchScreenRoute = "/patientSearchScreen";

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
        initSignWithGoogleUseCase();
        return MaterialPageRoute(
          settings: RouteSettings(name: settings.name),
          builder: (_) => const LoginScreen(),
        );

      case Routes.registerRoute:
        initRegisterUseCase();
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case Routes.nurseMainLayoutRoute:
        initLogOutUseCase();
        initGetPatientUseCase();
        return MaterialPageRoute(builder: (_) => const NurseMainLayOutScreen());
      case Routes.doctorMainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const DoctorMainLayOut());
      case Routes.nurseHomeScreenRoute:
        initAddPatientUseCase();
        initGetPatientUseCase();

        return MaterialPageRoute(builder: (_) => const NurseHomeScreen());
       case Routes.patientScreenRoute:
         initGetPatientUseCase();
         return MaterialPageRoute(builder: (_) => const PatientScreen());
      case Routes.patientSearchScreenRoute:
        return MaterialPageRoute(builder: (_) => const PatientSearchScreen());


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
