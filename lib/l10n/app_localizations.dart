import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the generated localization messages

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) async {
    // final String name = locale.languageCode;
    // final String localeName = Intl.canonicalizedLocale(name);

    // return initializeMessages(localeName).then((_) {
    // Intl.defaultLocale = localeName;
    return AppLocalizations();
    // });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  String get appTitle => Intl.message('Flutter Boilerplate', name: 'appTitle');
  String get login => Intl.message('Login', name: 'login');
  String get expenses => Intl.message('Expenses', name: 'expenses');
  String get language => Intl.message('Language', name: 'language');
  String get welcomeBack => Intl.message('Welcome Back', name: 'welcomeBack');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'hi', 'gu'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
