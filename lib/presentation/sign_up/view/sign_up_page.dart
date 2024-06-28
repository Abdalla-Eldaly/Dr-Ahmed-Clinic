import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';
import 'package:zag_nights/presentation/sign_up/view/widgets/sign_up_form.dart';
import 'package:zag_nights/presentation/sign_up/view/widgets/sign_up_page_header.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpPageHeader(),
                SizedBox(height: AppPadding.p14),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
