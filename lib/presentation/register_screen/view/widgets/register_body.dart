import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';
import 'package:zag_nights/presentation/common/widget/main_text_field.dart';
import 'package:zag_nights/presentation/register_screen/view/widgets/sign_up_page_header.dart';
import 'package:zag_nights/presentation/register_screen/viewmodel/register_viewmodel.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/routes_manager.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import '../../../../app/App_Defults.dart';
import '../../../common/validators/validators.dart';
import '../../../resources/text_styles.dart';
import '../../../resources/values_manager.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';

class RegisterBody extends StatelessWidget {
  final RegistereViewmodel viewModel;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.registerBackGround2),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SignUpPageHeader(),
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
                      color: Colors.white.withOpacity(0.96), // Semi-transparent card
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              Center(
                                child: AppButton(
                                  text: AppStrings.registerBtn.tr(),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      viewModel.register();
                                    }
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: AppSize.s10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, Routes.loginRoute);
                                  },
                                  child: Text(
                                    AppStrings.loginScreenHaveAccount.tr(),
                                    style: AppTextStyles.createAccountTextStyle(context),
                                  ),
                                ),
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
