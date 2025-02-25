import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import '../../main.dart';
import 'font_manager.dart';

enum Languages { ar, en }

Languages appLanguage = Languages.ar; // Default language set to Arabic

class AppLanguages {
  static const List<Locale> locals = [Locale('en'), Locale('ar')];
  static const Locale startLocal = Locale('ar');
  static const Locale fallBackLocal = Locale('ar');
  static String translationsPath = 'assets/translations';

  static void init(BuildContext context) {
    appLanguage = getCurrentLang(context);
  }

  static void toggleLocal(BuildContext context) async {
    if (context.locale == locals.first) {
      context.setLocale(locals.last);
      appLanguage = Languages.ar;
    } else {
      appLanguage = Languages.en;
      context.setLocale(locals.first);
    }
    await engine.performReassemble();
  }

  static void setLanguageArabic(BuildContext context) async {
    context.setLocale(locals.last);
    appLanguage = Languages.ar;
    await engine.performReassemble();
  }

  static void setLanguageEnglish(BuildContext context) async {
    context.setLocale(locals.first);
    appLanguage = Languages.en;
    await engine.performReassemble();
  }

  static String getCurrentLocal(BuildContext context) {
    return context.locale.languageCode;
  }

  static String getPrimaryFont(BuildContext context) {
    Languages language = getCurrentLang(context);
    if (language == Languages.ar) {
      return FontConstants.primaryArabicFont;
    } else {
      return FontConstants.primaryEnglishFont;
    }
  }

  // static String getSecondaryFont(BuildContext context) {
  //   Languages language = getCurrentLang(context);
  //   if (language == Languages.ar) {
  //     return FontConstants.secondaryArabicFont;
  //   } else {
  //     return FontConstants.secondaryEnglishFont;
  //   }
  // }

  static Languages getCurrentLang(BuildContext context) {
    switch (getCurrentLocal(context)) {
      case 'en':
        return Languages.en;
      case 'ar':
        return Languages.ar;
      default:
        return Languages.ar;
    }
  }

  static TextDirection getCurrentTextDirection(BuildContext context) {
    switch (context.locale.languageCode) {
      case 'en':
        return TextDirection.ltr;
      case 'ar':
        return TextDirection.rtl;
      default:
        return TextDirection.ltr;
    }
  }
}
