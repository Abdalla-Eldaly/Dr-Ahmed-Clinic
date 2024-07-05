import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/common/widget/main_app_bar.dart';
import 'package:zag_nights/presentation/mainlayout_screen/view/widgets/nurse_body.dart';
import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/font_manager.dart';

import '../../resources/strings_manager.dart';
import '../../resources/text_styles.dart';

class NurseMainLayOutScreen extends StatelessWidget {
  const NurseMainLayOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: buildMainAppBar(
        context,
        Text(
          AppStrings.selectionScreenLanguageButton.tr(),
          style: AppTextStyles.generalTextStyle(
              context, ColorManager.tertiary, FontSize.f20),
        ),
      ),
      body: NurseScreenBody(),
    );
  }
}
