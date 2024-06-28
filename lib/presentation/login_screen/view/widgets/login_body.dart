import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/presentation/login_screen/viewmodel/login_viewmodel.dart';
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
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


   final FocusNode emailFocusNode = FocusNode();
   final FocusNode passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LoginPageHeader(),
              SizedBox(height: BuildContextExt(context).minDim()*.12,),
              Padding(
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

                          },
                          child: Text(AppStrings.loginScreenForgetPassword.tr(), style: const TextStyle(
                            decoration: TextDecoration.underline,
                            color: ColorManager.primary,

                          ),),
                        ),
                      ),


                       Center(
                         child: SizedBox(
                           child: AppButton(text: AppStrings.loginScreenLoginButton.tr(),onPressed: () {

                           },),
                         ),
                       ),


                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSize.s10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.mainLayoutRoute);
                          },
                          child:  Text(AppStrings.loginScreenCreatePassword.tr(),style: AppTextStyles.createAccountTextStyle(context),),
                        ),
                      ),



                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
