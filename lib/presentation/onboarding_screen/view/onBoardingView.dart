import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p100),
              child: SizedBox.square(
                dimension: AppSize.s150,
                child: Hero(
                  tag: 'app-logo',
                  child: Transform.flip(
                    flipX: false,
                    child: SvgPicture.asset(SVGAssets.logo),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p40),
              child: SizedBox(
                width: AppSize.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.selectionRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.black,
                    foregroundColor: ColorManager.white,
                    surfaceTintColor: ColorManager.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s10),
                    ),
                  ),
                  child: Text(
                    AppStrings.selectionGetStart.tr(),
                    style: AppTextStyles.baseStatesElevatedBtnTextStyle(
                        context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}