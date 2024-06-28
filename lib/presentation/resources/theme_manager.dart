import 'color_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    useMaterial3: true,
    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primary,
    primaryColorDark: ColorManager.primary,
    disabledColor: ColorManager.black,
    // ripple effect color
    splashColor: ColorManager.transparent,
    scaffoldBackgroundColor: ColorManager.white,
    // app bar theme
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.black,
      iconTheme: IconThemeData(color: ColorManager.white), //add this line here
    ),
    dialogTheme: const DialogTheme(
        backgroundColor: ColorManager.white,
        surfaceTintColor: ColorManager.transparent),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     backgroundColor: ColorManager.primary,
    //     selectedIconTheme: IconThemeData(
    //       color: ColorManager.secondary,
    //       size: AppSize.s34,
    //     ),
    //     showUnselectedLabels: true,
    //
    //     unselectedIconTheme: IconThemeData(
    //       color: ColorManager.white,
    //       size: AppSize.s34,
    //     ),
    //     selectedItemColor: ColorManager.secondary,
    //     unselectedItemColor: ColorManager.white,
    //     showSelectedLabels: true,
    //     type: BottomNavigationBarType.fixed,
    //     selectedLabelStyle:
    //         AppTextStyles.btnNavBarSelectedLabelTextStyle(null),
    //     unselectedLabelStyle:
    //         AppTextStyles.btnNavBarUnselectedLabelTextStyle(null)),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s100),
      ),
      disabledColor: ColorManager.primary,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),

    // elevated button them
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ColorManager.white,
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s100),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: ColorManager.transparent,
        foregroundColor: ColorManager.primary,
        shape: const StadiumBorder(),
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ColorManager.white,
      selectionColor: ColorManager.tertiary,
      selectionHandleColor: ColorManager.tertiary
    ),

    dialogBackgroundColor: ColorManager.secondary,

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p12),
      focusColor: ColorManager.primary,
      hoverColor: ColorManager.primary,
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.white,
        ),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.tertiary,
        ),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.white,
        ),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: ColorManager.white,
        ),
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      // hint style
    ),
  );
}
