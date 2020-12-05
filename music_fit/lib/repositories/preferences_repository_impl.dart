import 'dart:ui';
import 'package:music_fit/repositories/preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  static const String _localeLanguageCodeKey = 'localeLanguajeCode';
  static const String _localeScriptCodeKey = 'localeScriptCode';
  static const String _localeCountryCodeKey = 'localeCountryCode';

  @override
  Future<void> saveLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_localeLanguageCodeKey, locale?.languageCode);
    await prefs.setString(_localeScriptCodeKey, locale?.scriptCode);
    await prefs.setString(_localeCountryCodeKey, locale?.countryCode);
  }

  @override
  Future<Locale> get locale async {
    final prefs = await SharedPreferences.getInstance();

    final languagecode = prefs.getString(_localeLanguageCodeKey);
    final scriptcode = prefs.getString(_localeScriptCodeKey);
    final countrycode = prefs.getString(_localeCountryCodeKey);

    if (languagecode != null) {
      return Locale.fromSubtags(
        languageCode: languagecode,
        scriptCode: scriptcode,
        countryCode: countrycode,
      );
    }

    return null;
  }
}
