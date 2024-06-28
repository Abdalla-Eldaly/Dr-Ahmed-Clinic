import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';

class SignUpPageHeader extends StatelessWidget {
  const SignUpPageHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          'Welcome to',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          'Dr-Ahmed Clinic',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorManager.primary,
          ),
        )
      ],
    );
  }
}
