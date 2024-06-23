import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/widget/app_button.dart';

import '../../resources/color_manager.dart';
import '../../resources/font_manager.dart';
import '../../resources/langauge_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

//
AppBar buildMainAppBar(
  BuildContext context, {
  Color? color = ColorManager.transparent,
  double elevation = 4,
}) {
  return AppBar(
    backgroundColor: color,
    leadingWidth: AppSize.s100,
    leading: AppButton(
      onPressed: () {
        AppLanguages.toggleLocal(context);
      },
      color: ColorManager.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.language_outlined,
            size: AppSize.s20,
            color: ColorManager.white,
          ),
          Text(
            AppStrings.selectionScreenLanguageButton.tr(),
            style: getBoldStyle(
              color: ColorManager.white,
              fontSize: FontSize.f12,
            ),
          ),
        ],
      ),
    ),
    elevation: elevation,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
  );
}
