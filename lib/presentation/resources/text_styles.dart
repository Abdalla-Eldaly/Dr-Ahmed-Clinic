import 'package:flutter/material.dart';
import 'package:zag_nights/app/extensions.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'langauge_manager.dart';
import 'styles_manager.dart';

class AppTextStyles {
  AppTextStyles._();

  //Base States

  static TextStyle baseStatesMessageTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.tertiary,
        fontSize: FontSize.f20,
      );

  static TextStyle baseStatesElevatedBtnTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: (context!.language == Languages.en)
          ? FontConstants.english
          : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f14,
      );

  //Main

  static TextStyle appButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  //Selection Screen

  static TextStyle selectionScreenLoginButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  static TextStyle selectionScreenRegisterButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  //Text Fields

  static TextStyle textFieldLabelTextStyle(BuildContext? context) =>
      getMediumStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f18,
      );

  static TextStyle textFieldValueTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f18,
      );

  static TextStyle authErrorTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.secondary,
        fontSize: FontSize.f20,
      );



  static TextStyle authLabelTextStyle(BuildContext context) => getRegularStyle(
    fontFamily: (context!.language == Languages.en)
        ? FontConstants.english
        : FontConstants.arabic,
    color: ColorManager.white,
    fontSize: FontSize.f18,
  );

  static TextStyle authHintTextStyle(BuildContext context) => getRegularStyle(
    fontFamily: (context!.language == Languages.en)
        ? FontConstants.english
        : FontConstants.arabic,
    color: ColorManager.white,
    fontSize: FontSize.f18,
  );


  //Login Screen

  static TextStyle loginScreenLoginButtonTextStyle(BuildContext? context) =>
      getRegularStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.white,
        fontSize: FontSize.f20,
      );

  //Register Screen

  static TextStyle registerPagesTitleTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.tertiary,
        fontSize: FontSize.f48,
      );

  static TextStyle registerDetailsPageGenderTextStyle(BuildContext? context, Color color) =>
      getBoldStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: color,
        fontSize: FontSize.f20,
      );

  static TextStyle registerJobsDialogTitleTextStyle(BuildContext? context) =>
      getExtraBoldStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.tertiary,
        fontSize: FontSize.f20,
      );

  static TextStyle registerJobsDialogItemTextStyle(BuildContext? context) =>
      getMediumStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.tertiary,
        fontSize: FontSize.f16,
      );

  //Soon Screen
  static TextStyle soonScreenTitleTextStyle(BuildContext? context) =>
      getBoldStyle(
        fontFamily: (context!.language == Languages.en)
            ? FontConstants.english
            : FontConstants.arabic,
        color: ColorManager.tertiary,
        fontSize: FontSize.f32,
      );

}
