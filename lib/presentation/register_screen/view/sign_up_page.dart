import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/register_screen/view/widgets/sign_up_form.dart';
import 'package:zag_nights/presentation/register_screen/view/widgets/sign_up_page_header.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          SignUpPageHeader(),
          SizedBox(height: AppSize.s14),
          // SignUpForm(),
        ],
      ),
    );
  }
}
