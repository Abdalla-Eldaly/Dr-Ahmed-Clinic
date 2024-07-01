import 'package:easy_localization/easy_localization.dart';
import '../../resources/strings_manager.dart';

class AppValidators {
  AppValidators._();
  static String? validateLogin(String? val) {
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else {
      return null;
    }
  }

  static String? validateName(String? val) {
    RegExp nameRegex = RegExp(
        r"^(?=.{2,30}$)[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+(?:\s[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+)?$");
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (!nameRegex.hasMatch(val)) {
      return AppStrings.validationsArabicAndEnglishLetters.tr();
    } else {
      return null;
    }
  }

  static String? validateAge(String? val) {
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return AppStrings.validationsNumbersOnly.tr();
    } else {
      return null;
    }
  }

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val.trim().isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (emailRegex.hasMatch(val) == false) {
      return AppStrings.validationsValidEmail.tr();
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (int.tryParse(val.trim()) == null) {
      return AppStrings.validationsNumbersOnly.tr();
    } else if (val.trim().length != 11) {
      return AppStrings.validationsNumbersMustEqual11Digit.tr();
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    RegExp passwordRegex = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])');
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val.length < 8 || !passwordRegex.hasMatch(val)) {
      return AppStrings.validationsPasswordSpecifications.tr();
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return AppStrings.validationsFieldRequired.tr();
    } else if (val != password) {
      return AppStrings.validationsEnterTheSamePassword.tr();
    } else {
      return null;
    }
  }
}

String? validateConfirmPassword(String? val, String? password) {
  if (val == null || val.isEmpty) {
    return AppStrings.validationsFieldRequired.tr();
  } else if (val != password) {
    return AppStrings.validationsEnterTheSamePassword.tr();
  } else {
    return null;
  }
}