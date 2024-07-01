import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';
import '../../../../domain/models/enums.dart';
import '../../../common/data_intent/data_intent.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/strings_manager.dart';
import '../../../resources/text_styles.dart';
import '../../../resources/values_manager.dart';

class SelectionBody extends StatelessWidget {
  const SelectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(
            height: AppSize.s10,
          ),
          Lottie.asset(LottieAssets.doctor),
          const SizedBox(
            height: AppSize.s40,
          ),
          SizedBox(
            width: BuildContextExt(context).minDim()*.7,

            child: AppButton(
              onPressed: () {
                DataIntent.setUserRole(UserRole.doctor);
                Navigator.pushNamed(context, Routes.registerRoute);
              },
               text: AppStrings.selectionScreenDoctorButton.tr(),
               textStyle: AppTextStyles.selectionTitleTextStyle(context),
            ),
          ),
          const SizedBox(height: AppSize.s30),
          SizedBox(
            width: BuildContextExt(context).minDim()*.7,
            child: AppButton(
              onPressed: () {
                DataIntent.setUserRole(UserRole.nurse);
                Navigator.pushNamed(context, Routes.registerRoute);
              },
              text: AppStrings.selectionScreenNurseButton.tr(),
              textStyle: AppTextStyles.selectionTitleTextStyle(context),
            ),
          )
        ],
      ),
    );
  }
}
