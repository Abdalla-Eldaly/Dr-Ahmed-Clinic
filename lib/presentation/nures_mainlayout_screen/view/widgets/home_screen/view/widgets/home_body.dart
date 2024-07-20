import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/home_screen/view/widgets/search_funcationalty.dart';

import '../../../../../../common/validators/validators.dart';
import '../../../../../../common/widget/app_button.dart';
import '../../../../../../common/widget/main_dialoge.dart';
import '../../../../../../common/widget/main_text_field.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/strings_manager.dart';
import '../../../../../../resources/text_styles.dart';
import '../../../../../../resources/values_manager.dart';
import '../../viewmodel/home_nurse_viewmodel.dart';

class NurseHomeBody extends StatelessWidget {
  const NurseHomeBody({super.key, required this.viewModel});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final HomeNurseViewModel viewModel;

  static final genderList = [
    AppStrings.patientMale.tr(),
    AppStrings.patientFemale.tr(),
  ];
  static final servicesList = [
    AppStrings.patientServices1,
    AppStrings.patientServices2,
    AppStrings.patientServices3,
    AppStrings.patientServices4,
    AppStrings.patientServices5,
  ];
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p14, vertical: AppPadding.p14),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: AppSize.s40,
                ),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const CircleAvatar(
                          backgroundColor: ColorManager.secondary,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorManager.white,
                          )),
                    )
                  ],
                ),
                Center(
                  child: Text(
                    AppStrings.nurseScreenTitle.tr(),
                    style: AppTextStyles.nurseTitleTextStyle(context),
                  ),
                ),
                MainTextField(
                  controller: viewModel.getPatientName,

                  prefixIcon: const Icon(Icons.person),
                  hint: AppStrings.patientNameHint.tr(),
                  label: AppStrings.patientName.tr(),
                  validation: AppValidators.validateEmpty,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: AppSize.s5,
                ),
                MainTextField(
                    controller: viewModel.getPatientAge,

                    validation: AppValidators.validateNotEmpty,
                    prefixIcon: const Icon(Icons.home_mini),
                    hint: AppStrings.patientAgeHint.tr(),
                    textInputType: TextInputType.phone,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(2),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    label: AppStrings.patientAge.tr()),
                const SizedBox(
                  height: AppSize.s5,
                ),
                MainTextField(
                    controller: viewModel.getPatientPhone,

                    validation: AppValidators.validatePhoneNumber,
                    prefixIcon: const Icon(Icons.phone_android),
                    textInputType: TextInputType.phone,
                    hint: AppStrings.patientPhoneHint.tr(),
                    label: AppStrings.patientPhoneHint.tr()),
                const SizedBox(
                  height: AppSize.s5,
                ),
                MainTextField(
                    controller: viewModel.getPatientGender,
                    readOnly: true,
                    onTap: () {
                      showRegisterDialog(
                        context,
                        onSelect: (v) {
                          viewModel.getPatientGender.text = v;
                        },
                        items: genderList,
                        title: AppStrings.patientGender.tr(),
                      );
                    },
                    prefixIcon: const Icon(Icons.man),
                    validation: AppValidators.validateNotEmpty,
                    hint: AppStrings.patientGenderHint.tr(),
                    label: AppStrings.patientGender.tr()),
                const SizedBox(
                  height: AppSize.s5,
                ),
                MainTextField(
                  controller: viewModel.getPatientAddress,

                    readOnly: true,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              padding: const EdgeInsets.only(
                                top: AppPadding.p8,
                                right: AppPadding.p12,
                              ),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(AppSize.s18),
                                    topLeft: Radius.circular(AppSize.s18),
                                  ),
                                  color: ColorManager.white),
                              child: SearchFunctionalityState(
                                viewModel: viewModel,
                              ),
                            ),
                          );
                        },
                      );
                    },
                    prefixIcon: const Icon(Icons.home),
                    textInputType: TextInputType.multiline,
                    validation: AppValidators.validateNotEmpty,
                    hint: AppStrings.patientAddressHint.tr(),
                    label: AppStrings.patientAddress.tr()),
                const SizedBox(
                  height: AppSize.s5,
                ),
                MainTextField(
                    controller: viewModel.getPatientServices,

                    readOnly: true,
                    onTap: () {
                      showRegisterDialog(
                        context,
                        onSelect: (v) {
                          viewModel.getPatientServices.text = v;
                        },
                        items: servicesList,
                        title: AppStrings.patientServices.tr(),
                      );
                    },
                    validation: AppValidators.validateNotEmpty,
                    prefixIcon: const Icon(Icons.design_services_outlined),
                    hint: AppStrings.patientServicesHint.tr(),
                    label: AppStrings.patientServices.tr()),
                const SizedBox(
                  height: AppSize.s15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: AppButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        viewModel.addPatient();
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
