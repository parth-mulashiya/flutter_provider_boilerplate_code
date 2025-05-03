import 'dart:convert';
import 'package:demo_app/core/constants/storage_constants.dart';
import 'package:demo_app/core/services/shared_prefs_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LanguageService extends ChangeNotifier {
  LanguageService() {
    _init();
  }

  Locale _currentLocale = const Locale('en');
  Locale get currentLocale => _currentLocale;

  Map<String, dynamic> _translations = {};
  Map<String, dynamic> _selectedTranslations = {};
  Map<String, dynamic> get translations => _selectedTranslations;

  Future<void> _init() async {
    await _loadLocale();
    await _loadTranslations();
    notifyListeners();
  }

  Future<void> _loadLocale() async {
    final langCode =
        SharedPrefsService.getValue(StorageConstants.locale) ?? 'en';
    _currentLocale = Locale(langCode);
  }

  Future<void> _loadTranslations() async {
    try {
      final res = await rootBundle.loadString('assets/language/lang.json');
      _translations = json.decode(res);
      _selectedTranslations =
          _translations[_currentLocale.languageCode] ??
          _translations['en'] ??
          {};
    } catch (e) {
      print('Error loading translations: $e');
      _selectedTranslations = {};
    }
  }

  Future<void> changeLanguage(Locale locale) async {
    _currentLocale = locale;
    _selectedTranslations =
        _translations[locale.languageCode] ?? _translations['en'] ?? {};
    await SharedPrefsService.setValue(
      StorageConstants.locale,
      locale.languageCode,
    );
    notifyListeners();
  }

  String translate(String key) {
    return _selectedTranslations[key] ?? key;
  }
}
