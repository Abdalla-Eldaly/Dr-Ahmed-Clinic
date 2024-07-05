import 'package:flutter/material.dart';
import 'package:zag_nights/app/extensions.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'langauge_manager.dart';
import 'styles_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  //Base States
  static TextStyle baseStatesMessageTextStyle(BuildContext context,
      [Color? textColor]) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: textColor ?? ColorManager.white,
        fontSize: FontSize.f22,
      );

  static TextStyle baseStatesElevatedBtnTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.white,
        fontSize: FontSize.f14,
      );

  static TextStyle generalTextStyle(BuildContext context, Color color , double fontSize) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: color,
        fontSize: fontSize,
      );

  ///Splash Text Styles

  // static TextStyle splashScreenTitleTextStyle(BuildContext context) =>
  //     getBoldStyle(
  //       fontFamily: AppLanguages.getPrimaryFont(context),
  //       color: ColorManager.lightGrey,
  //       fontSize: FontSize.f32,
  //     );
  //
  // static TextStyle splashScreenSubTitleTextStyle(BuildContext context) =>
  //     getLightStyle(
  //       fontFamily: AppLanguages.getPrimaryFont(context),
  //       color: ColorManager.offwhite.withOpacity(.6),
  //       fontSize: FontSize.f18,
  //     );

  ///onBoarding Text Styles

  // static TextStyle onBoardingTextStyle(BuildContext context) => getLightStyle(
  //   fontFamily: AppLanguages.getPrimaryFont(context),
  //   color: ColorManager.offwhite.withOpacity(.6),
  //   fontSize: FontSize.f24,
  // );
  //
  // static TextStyle onBoardingButtonTextStyle(BuildContext context) =>
  //     getBoldStyle(
  //       fontFamily: AppLanguages.getPrimaryFont(context),
  //       color: ColorManager.primary,
  //       fontSize: FontSize.f30,
  //     );

  ///Selection Text Styles

  static TextStyle selectionTitleTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  // static TextStyle selectionSubTitleTextStyle(BuildContext context) =>
  //     getLightStyle(
  //       fontFamily: AppLanguages.getPrimaryFont(context),
  //       color: ColorManager.offwhite.withOpacity(.6),
  //       fontSize: FontSize.f24,
  //     );
  //
  // static TextStyle selectionOptionTextStyle(BuildContext context) =>
  //     getBoldStyle(
  //       fontFamily: AppLanguages.getPrimaryFont(context),
  //       color: ColorManager.primary,
  //       fontSize: FontSize.f30,
  //     );

  /// Auth Text Style
  //
  static TextStyle authLabelTextStyle(BuildContext context) => getRegularStyle(
    fontFamily: AppLanguages.getPrimaryFont(context),
    color: ColorManager.black,
    fontSize: FontSize.f14,
  );

  static TextStyle authHintTextStyle(BuildContext context) => getLightStyle(
    fontFamily: AppLanguages.getPrimaryFont(context),
    color: ColorManager.tertiary.withOpacity(.6),
    fontSize: FontSize.f17,
  );

  static TextStyle createAccountTextStyle(BuildContext context) => getRegularStyle(
    fontFamily: AppLanguages.getPrimaryFont(context),
    color: ColorManager.black.withOpacity(.7),
    fontSize: FontSize.f15,
  );

  static TextStyle authErrorTextStyle(BuildContext context) => getRegularStyle(
    fontFamily: AppLanguages.getPrimaryFont(context),
    color: ColorManager.error,
    fontSize: FontSize.f14,
  );

  ///Login Text Styles

  static TextStyle appButtonTextStyle(BuildContext context) => getBoldStyle(
    fontFamily: AppLanguages.getPrimaryFont(context),
    color: ColorManager.white,
    fontSize: FontSize.f18,
  );


  static TextStyle registerDialogTitleTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.primary,
        fontSize: FontSize.f30,
      );

  static TextStyle registerDialogItemTextStyle(BuildContext context) =>
      getRegularStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.primary,
        fontSize: FontSize.f20,
      );

  ///Forgot Password Text Styles

  static TextStyle forgotPasswordTitleTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.primary,
        fontSize: FontSize.f24,
      );

  static TextStyle forgotPasswordEmailValueTextStyle(BuildContext context) =>
      getLightStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.primary.withOpacity(.3),
        fontSize: FontSize.f20,
      );

  static TextStyle forgotPasswordSendCodeTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.white,
        fontSize: FontSize.f30,
      );


  ///nurse screen

  static TextStyle nurseTitleTextStyle(BuildContext context) =>
      getBoldStyle(
        fontFamily: AppLanguages.getPrimaryFont(context),
        color: ColorManager.primary,
        fontSize: FontSize.f30,
      );



}
