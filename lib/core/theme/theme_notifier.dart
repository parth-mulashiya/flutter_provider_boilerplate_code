import 'package:flutter/material.dart';
import 'app_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isDark = false;

  ThemeData get currentTheme =>
      isDark ? ThemeConfig.darkTheme : ThemeConfig.lightTheme;

  void toggleTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
