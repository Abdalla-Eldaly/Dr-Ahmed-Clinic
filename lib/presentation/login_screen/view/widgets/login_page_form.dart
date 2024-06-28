import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/validators/validators.dart';
import 'package:zag_nights/presentation/login_screen/view/widgets/login_button.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';

import '../../../common/widget/main_text_field.dart';

class LoginPageForm extends StatelessWidget {
  const LoginPageForm({
    super.key,
    required this.onPressed,
    required this.email_controller,
    required this.password_controller,
  });

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final void Function() onPressed;
  final TextEditingController email_controller;
  final TextEditingController password_controller;

  static final FocusNode emailFocusNode = FocusNode();
  static final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p14),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // Password Field
            MainTextField(
              maxLines: 1,
              controller: email_controller,
              focusNode: emailFocusNode,
              nextFocus: passwordFocusNode,
              validation: AppValidators.validateEmail,
              label: AppStrings.loginScreenEmail.tr(),
              isObscured: false,
              hint: AppStrings.loginScreenEmailHint.tr(),
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: AppSize.s20),

            MainTextField(
              maxLines: 1,
              controller: password_controller,
              focusNode: passwordFocusNode,
              validation: AppValidators.validatePassword,
              label: AppStrings.loginScreenPassword.tr(),
              isObscured: true,
              hint: AppStrings.loginScreenPasswordHint.tr(),
              iconData: Icons.remove_red_eye_outlined,
              textInputType: TextInputType.text,
            ),

            Row(
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child:  Text(AppStrings.loginScreenForgetPassword.tr()),
                ),
              ],
            // Forget Password label


            // Login Button
            ),
          ],
        ),
      ),
    );
  }
}
