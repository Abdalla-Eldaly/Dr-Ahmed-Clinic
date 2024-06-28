import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';
import 'package:zag_nights/presentation/common/widget/main_text_field.dart';
import 'package:zag_nights/presentation/register_screen/view/widgets/sign_up_page_header.dart';
import 'package:zag_nights/presentation/register_screen/viewmodel/register_viewmodel.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import '../../../../app/App_Defults.dart';
import '../../../common/validators/validators.dart';
import '../../../resources/values_manager.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key, required this.viewModel});

  final RegistereViewmodel viewModel;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SignUpPageHeader(),
          Container(
            margin: const EdgeInsets.all(AppMargin.m16),
            padding: const EdgeInsets.all(AppSize.s14),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: AppDefults.boxShadow,
              borderRadius: AppDefults.borderRadius,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSize.s20),
                  MainTextField(
                    hint: AppStrings.loginUserNameHintScreenEmail.tr(),
                    maxLines: 1,
                    controller: viewModel.getNameController,
                    focusNode: viewModel.nameFocusNode,
                    nextFocus: viewModel.emailFocusNode,
                    validation: AppValidators.validateName,
                    label: AppStrings.loginUserNameScreenEmail.tr(),
                    isObscured: false,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: AppSize.s20),
                  MainTextField(
                    hint: AppStrings.loginScreenEmailHint.tr(),
                    maxLines: 1,
                    controller: viewModel.getEmailController,
                    focusNode: viewModel.emailFocusNode,
                    nextFocus: viewModel.passwordFocusNode,
                    validation: AppValidators.validateEmail,
                    label: AppStrings.loginScreenEmail.tr(),
                    isObscured: false,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: AppSize.s20),
                  const SizedBox(height: 8),
                  MainTextField(
                    hint: AppStrings.loginScreenPasswordHint.tr(),
                    maxLines: 1,
                    controller: viewModel.getPasswordController,
                    focusNode: viewModel.passwordFocusNode,
                    nextFocus: viewModel.passwordconfirmationFocusNode,
                    validation: AppValidators.validatePassword,
                    label: AppStrings.loginScreenPassword.tr(),
                    isObscured: true,
                    iconData: Icons.remove_red_eye_outlined,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: AppSize.s20),
                  MainTextField(
                    hint: AppStrings.loginScreenPasswordConfirmationHint.tr(),
                    maxLines: 1,
                    controller: viewModel.getPasswordConfirmationController,
                    focusNode: viewModel.passwordconfirmationFocusNode,
                    validation: (val) => validateConfirmPassword(
                        val, viewModel.getPasswordController.text),
                    label: AppStrings.loginScreenPassword.tr(),
                    isObscured: true,
                    iconData: Icons.remove_red_eye_outlined,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: AppSize.s20),

                  AppButton(
                    text: AppStrings.registerBtn.tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        return viewModel.register();
                      }
                    },
                  ),
                  const SizedBox(height: AppSize.s20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
