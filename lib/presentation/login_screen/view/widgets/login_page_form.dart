import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/validators/validators.dart';
import 'package:zag_nights/presentation/login_screen/view/widgets/login_button.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPageForm> createState() => _LoginPageFormState();
}

class _LoginPageFormState extends State<LoginPageForm> {
  final _key = GlobalKey<FormState>();

  bool isPasswordShown = false;

  void onPassShowClicked() {
    isPasswordShown = !isPasswordShown;
    setState(() {});
  }

  void onLogin() {
    final bool isFormOkay = _key.currentState?.validate() ?? false;
    if (isFormOkay) {
      // Handle login
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p14),
      child: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Email Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(AppStrings.loginScreenLoginButton.tr()),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: AppValidators.validateEmail,
                ),
              ],
            ),
            const SizedBox(height: AppPadding.p14),

            // Password Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Password"),
                const SizedBox(height: 8),
                TextFormField(
                  onFieldSubmitted: (v) => onLogin(),
                  textInputAction: TextInputAction.done,
                  obscureText: !isPasswordShown,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: onPassShowClicked,
                      icon: Icon(
                        isPasswordShown ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
              ],
            ),

            // Forget Password label
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: const Text('?Forget Password'),
              ),
            ),

            // Login Button
            LoginButton(onPressed: onLogin),
          ],
        ),
      ),
    );
  }
}
