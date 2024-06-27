import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/login_screen/viewmodel/login_viewmodel.dart';

import 'login_header.dart';
import 'login_page_form.dart';

class LoginBody extends StatelessWidget {
  final LoginViewModel viewModel;
  const LoginBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginPageHeader(),
              LoginPageForm(onPressed: viewModel.login, email_controller: viewModel.getEmailController, password_controller: viewModel.getPasswordController,),


            ],
          ),
        ),
      ),
    );
  }
}
