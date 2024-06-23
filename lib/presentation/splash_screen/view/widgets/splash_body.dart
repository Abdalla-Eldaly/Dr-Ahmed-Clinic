import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';
import 'package:zag_nights/presentation/resources/constants_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  Timer? _timer;

  @override
  void initState() {

    super.initState();
  }

  startDelay(){

    _timer = Timer(const Duration(seconds: AppConstants.splashDelay),goNext());
  }

  goNext() {

  }

  @override
  void dispose() {

    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(SVGAssets.logo),
          ],
        ),
      ),
    );
  }
}
