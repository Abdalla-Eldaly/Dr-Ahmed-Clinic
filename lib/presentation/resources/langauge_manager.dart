import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

import '../../main.dart';

enum Languages { ar, en }

Languages appLanguage = Languages.en;

class AppLanguages {
  static const List<Locale> locals = [Locale('en'), Locale('ar')];
  static const Locale startLocal = Locale('ar');
  static const Locale fallBackLocal = Locale('en');
  static String translationsPath = 'assets/translations';

  static void init(BuildContext context){
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

  static String getCurrentLocal(BuildContext context) {
    return context.locale.languageCode;
  }

  static Languages getCurrentLang(BuildContext context) {
    switch (getCurrentLocal(context)) {
      case 'en':
        return Languages.en;
      case 'ar':
        return Languages.ar;
      default:
        return Languages.en;
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
extension LanguagesTypeExt on Languages{
  String getValue(){

    switch(this){
      case Languages.ar:
        return 'ar';
      case Languages.en:
        return 'en';
      default:
        return 'en';
    }
}
}