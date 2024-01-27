import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

import '../constant/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

const String PREFS_KEY_IS_USER_OPENED_REGISTER = "PREFS_KEY_IS_USER_OPENED_REGISTER";

const String LOGGED_IN_TOKEN = "LOGGED_IN_TOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  static bool isLangChanged = false;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
      isLangChanged = false;
    } else {
      // set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
      isLangChanged = true;
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      isLangChanged = true;
      return ARABIC_LOCAL;
    } else {
      isLangChanged = false;
      return ENGLISH_LOCAL;
    }
  }


  //login
  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }

  //Token
  Future<bool> setToken(String key, String token) async {
    return await _sharedPreferences.setString(key, token);
  }

  String? getToken(String key) {
    return _sharedPreferences.getString(key);
  }


}