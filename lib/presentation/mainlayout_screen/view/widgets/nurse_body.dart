import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/widget/main_text_field.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import 'package:zag_nights/presentation/resources/text_styles.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';

class NurseScreenBody extends StatelessWidget {
  const NurseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14,vertical: AppPadding.p14),
        child: Column(
          children: [

            Center(child: Text(AppStrings.nurseScreenTitle.tr(),style: AppTextStyles.nurseTitleTextStyle(context),),),
            MainTextField(prefixIcon: Icons.person,hint: AppStrings.patientNameHint.tr(), label:AppStrings.patientName.tr() ,),
            MainTextField(prefixIcon: Icons.home_mini,hint: AppStrings.patientAgeHint.tr(),label:AppStrings.patientAge.tr() ),
            MainTextField(prefixIcon: Icons.home_mini,hint: AppStrings.patientPhoneHint.tr(),label:AppStrings.patientPhoneHint.tr() ),
            MainTextField(prefixIcon: Icons.man,hint: AppStrings.patientGenderHint.tr(),label:AppStrings.patientGender.tr() ),
            MainTextField(prefixIcon: Icons.home,hint: AppStrings.patientAddressHint.tr(),label:AppStrings.patientAddress.tr() ),
            MainTextField(prefixIcon: Icons.design_services_outlined,hint: AppStrings.patientServicesHint.tr(),label:AppStrings.patientServices.tr() ),
          ],
        ),
      ),
    );
  }
}
