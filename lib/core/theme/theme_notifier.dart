import 'package:demo_app/core/constants/storage_constants.dart';
import 'package:demo_app/core/services/shared_prefs_service.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;

  ThemeNotifier() {
    _loadTheme();
  }

  bool get isDark => _isDark;

  ThemeData get currentTheme =>
      _isDark ? ThemeConfig.darkTheme : ThemeConfig.lightTheme;

  void toggleTheme() async {
    _isDark = !_isDark;
    notifyListeners();
    await SharedPrefsService.setValue(StorageConstants.isDarkMode, _isDark);
  }

  void _loadTheme() async {
    _isDark =
        SharedPrefsService.getValue<bool>(StorageConstants.isDarkMode) ?? false;
    notifyListeners();
  }
}
