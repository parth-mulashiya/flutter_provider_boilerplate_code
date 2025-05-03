import 'dart:convert';
import 'package:demo_app/core/constants/storage_constants.dart';
import 'package:demo_app/core/services/shared_prefs_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LanguageService extends ChangeNotifier {
  LanguageService() {
    fetchTranslations();
  }

  Locale _currentLocale = Locale('en');
  Locale get currentLocale => _currentLocale;

  Map<String, dynamic> _translations = {};
  Map<String, dynamic> _selectedTranslations = {};

  Map<String, dynamic> get translations => _selectedTranslations;
  set translations(Map<String, dynamic> value) {
    _selectedTranslations = value;
    notifyListeners();
  }

  Future<String> getLanguagePreference() async {
    String lang = SharedPrefsService.getValue(StorageConstants.locale) ?? 'en';
    _currentLocale = Locale(lang);
    return _currentLocale.languageCode;
  }

  Future<void> setLanguagePreference(String lang) async {
    _currentLocale = Locale(lang);
    await SharedPrefsService.setValue(StorageConstants.locale, lang);
  }

  Future<void> fetchTranslations() async {
    try {
      final langCode = await getLanguagePreference();
      final res = await rootBundle.loadString('assets/language/lang.json');
      final Map<String, dynamic> decoded = json.decode(res);

      _translations = decoded;
      _selectedTranslations = decoded[langCode] ?? decoded['en'] ?? {};

      notifyListeners();
    } catch (e) {
      print('Error fetching translations: $e');
    }
  }

  Future<void> changeLanguage(Locale newLocale) async {
    _currentLocale = newLocale;
    _selectedTranslations =
        _translations[newLocale.languageCode] ?? _translations['en'] ?? {};
    await setLanguagePreference(newLocale.languageCode);
    notifyListeners();
  }
}
