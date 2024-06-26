import 'package:flutter/material.dart';
import 'dart:async';

// Import the necessary packages for Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zag_nights/presentation/onboarding_screen/view/onBoardingView.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';
import 'package:zag_nights/presentation/resources/constants_manager.dart';


class SplashScreen extends StatefulWidget {
  static String routeName ='splashscreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds:2),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(seconds: 1),
          pageBuilder: (_, __, ___) => const OnBoardingView(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _animation.value,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.22,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(SVGAssets.logo),
              ),
            );
          },
        ),
      ),
    );
  }
}