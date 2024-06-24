import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/login_screen/login_screen_view/login_header.dart';
import 'package:zag_nights/presentation/login_screen/login_screen_view/login_page_form.dart';

class Login_View extends StatelessWidget {
  const Login_View({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoginPageHeader(),
                LoginPageForm(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
