import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/resources/langauge_manager.dart';

const PREFE_KEY_LANG = "App_Prefe_Language_Key";
class AppPreferences{

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);
  Future<String> getAppLanguage() async{
    String? language = _sharedPreferences.getString(PREFE_KEY_LANG);
    if(language != null && language.isNotEmpty){

      return language;
    }else{
      return Languages.en.getValue();
    }
  }
}