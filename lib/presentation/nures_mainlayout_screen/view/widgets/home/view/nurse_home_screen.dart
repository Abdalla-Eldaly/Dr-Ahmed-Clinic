import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../common/validators/validators.dart';
import '../../../../../common/widget/app_button.dart';
import '../../../../../common/widget/main_text_field.dart';
import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/text_styles.dart';
import '../../../../../resources/values_manager.dart';
import '../../nurse_body.dart';

class NurseHomeScreen extends StatelessWidget {
  const NurseHomeScreen({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p14, vertical: AppPadding.p14),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: Text(
                  AppStrings.nurseScreenTitle.tr(),
                  style: AppTextStyles.nurseTitleTextStyle(context),
                ),
              ),
              MainTextField(
                prefixIcon: Icons.person,
                hint: AppStrings.patientNameHint.tr(),
                label: AppStrings.patientName.tr(),
                validation: AppValidators.validateEmpty,
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
              MainTextField(
                  validation: AppValidators.validateNotEmpty,
                  prefixIcon: Icons.home_mini,
                  hint: AppStrings.patientAgeHint.tr(),
                  label: AppStrings.patientAge.tr()),
              const SizedBox(
                height: AppSize.s5,
              ),
              MainTextField(
                  validation: AppValidators.validatePhoneNumber,
                  prefixIcon: Icons.phone_android,
                  hint: AppStrings.patientPhoneHint.tr(),
                  label: AppStrings.patientPhoneHint.tr()),
              const SizedBox(
                height: AppSize.s5,
              ),
              MainTextField(
                  prefixIcon: Icons.man,
                  validation: AppValidators.validateNotEmpty,
                  hint: AppStrings.patientGenderHint.tr(),
                  label: AppStrings.patientGender.tr()),
              const SizedBox(
                height: AppSize.s5,
              ),
              MainTextField(
                  prefixIcon: Icons.home,
                  validation: AppValidators.validateEmpty,
                  hint: AppStrings.patientAddressHint.tr(),
                  label: AppStrings.patientAddress.tr()),
              const SizedBox(
                height: AppSize.s5,
              ),
              MainTextField(
                  validation: AppValidators.validateNotEmpty,
                  prefixIcon: Icons.design_services_outlined,
                  hint: AppStrings.patientServicesHint.tr(),
                  label: AppStrings.patientServices.tr()),
              const SizedBox(
                height: AppSize.s15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: AppButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      print('patient added successfully');
                    }
                  },
                  text: AppStrings.addPatient.tr(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
