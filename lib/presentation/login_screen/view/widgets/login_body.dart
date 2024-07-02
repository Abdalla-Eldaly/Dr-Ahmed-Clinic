import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/presentation/login_screen/viewmodel/login_viewmodel.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';
import 'package:zag_nights/presentation/resources/text_styles.dart';

import '../../../common/validators/validators.dart';
import '../../../common/widget/app_button.dart';
import '../../../common/widget/main_text_field.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/values_manager.dart';
import 'login_header.dart';

class LoginBody extends StatefulWidget {
  final LoginViewModel viewModel;
  const LoginBody({super.key, required this.viewModel});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [ColorManager.primary, ColorManager.secondary],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginPageHeader(),
                  SizedBox(
                    height: BuildContextExt(context).minDim() * .12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p14),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 5,
                      color: Colors.white.withOpacity(0.85), // Change the card color and make it semi-transparent
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              MainTextField(
                                maxLines: 1,
                                controller: widget.viewModel.getEmailController,
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
                                controller: widget.viewModel.getPasswordController,
                                focusNode: passwordFocusNode,
                                validation: AppValidators.validatePassword,
                                label: AppStrings.loginScreenPassword.tr(),
                                isObscured: true,
                                hint: AppStrings.loginScreenPasswordHint.tr(),
                                iconData: Icons.remove_red_eye_outlined,
                                textInputType: TextInputType.text,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSize.s10),
                                child: InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      backgroundColor: ColorManager.white,
                                      context: context,
                                      builder: (context) {
                                        return SizedBox(
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              const SizedBox(height: AppSize.s50),
                                              Padding(
                                                padding: const EdgeInsets.all(AppPadding.p22),
                                                child: MainTextField(
                                                  maxLines: 1,
                                                  controller: widget.viewModel.getEmailController,
                                                  label: AppStrings.loginScreenEmail.tr(),
                                                  hint: AppStrings.loginScreenForgetPasswordHint.tr(),
                                                ),
                                              ),
                                              AppButton(
                                                text: AppStrings.loginScreenSendCode.tr(),
                                                onPressed: () {
                                                  widget.viewModel.resetPassword();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Text(
                                    AppStrings.loginScreenForgetPassword.tr(),
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: ColorManager.primary,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  child: AppButton(
                                    text: AppStrings.loginScreenLoginButton.tr(),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        widget.viewModel.login();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSize.s10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.registerRoute);
                                  },
                                  child: Text(
                                    AppStrings.loginScreenCreatePassword.tr(),
                                    style: AppTextStyles.createAccountTextStyle(context),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    AppStrings.loginScreenGoogleSignIn.tr(),
                                    style: AppTextStyles.createAccountTextStyle(context),
                                  ),
                                  SizedBox(
                                    width: AppSize.s50,
                                    height: AppSize.s50,
                                    child: SvgPicture.asset(SVGAssets.google),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
