import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../../save_favorite_posts/shared/constant/language_manager.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  static bool isLangChanged = false;

  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
      isLangChanged = false;
    } else {
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
}