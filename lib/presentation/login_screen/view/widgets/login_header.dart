import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';

class LoginPageHeader extends StatelessWidget {
  const LoginPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SVGAssets.logo, // Assuming you have a logo asset
            height: 80,
          ),
          const SizedBox(height: 20.0),
          Text(
            'Welcome to',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Dr-Ahmed Clinic',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
