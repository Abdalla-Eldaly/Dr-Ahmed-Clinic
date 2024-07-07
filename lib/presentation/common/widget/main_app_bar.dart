import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zag_nights/presentation/resources/font_manager.dart';
import 'package:zag_nights/presentation/resources/text_styles.dart';
import '../../resources/color_manager.dart';
import '../../resources/langauge_manager.dart';
import '../../resources/values_manager.dart';

AppBar buildMainAppBar(BuildContext context, String? title,
    [Color color = ColorManager.transparent]) {
  return AppBar(
    toolbarHeight: AppSize.s80,
    backgroundColor: color,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    centerTitle: false,
    scrolledUnderElevation: AppSize.s0,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(AppSize.s1_2),
      child: Container(
        color: ColorManager.tertiary,
        height: AppSize.s1_2,
      ),
    ),
    actions: [
      Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.language_rounded,
                  color: ColorManager.tertiary, size: AppSize.s35),
              onPressed: () {
                AppLanguages.toggleLocal(context);
              },
            ),
            Text(title.toString(),
                style: AppTextStyles.generalTextStyle(
                    context, ColorManager.tertiary, FontSize.f18)),
          ],
        ),
      ),
    ],
    elevation: AppSize.s0,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
  );
}
