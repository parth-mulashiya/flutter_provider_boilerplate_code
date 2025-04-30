import 'package:flutter/material.dart';

// class ColorConstants {
//   static const primaryColor = Color(0xFF026D94);
//   static const secondaryColor = Color(0xffE5E5E5);
//   static const accentColor = Color(0xffFF4081);
//   static const backgroundColor = Color(0xffFFFFFF);
//   static const primaryTextColor = Color(0xff212121);
//   static const secondaryTextColor = Color(0xff757575);
//   static const lightGray = Color(0xFFF3F3F3);
//   static const darkGray = Color(0xFF515355);
//   static const red = Color(0xFFbe273a);
//   static const green = Color(0xFF71a73f);
//   static const yellow = Color(0xFFce9c2f);
//   static const teal = Color(0xFF5ec1c3);
//   static Color shadow = primaryColor.withValues(alpha: .15);
// }

class ColorConstants {
  // Shared Base Colors
  static const primaryColor = Color(0xFF026D94);
  static const secondaryColor = Color(0xffE5E5E5);
  static const lightGray = Color(0xFFF3F3F3);
  static const darkGray = Color(0xFF515355);
  static const accent = Color(0xffFF4081);
  static const red = Color(0xFFbe273a);
  static const green = Color(0xFF71a73f);
  static const yellow = Color(0xFFce9c2f);
  static const teal = Color(0xFF5ec1c3);
  static const shadow = Color.fromRGBO(2, 109, 148, 0.15);

  // Light Theme Colors
  static var light = _LightColors();

  // Dark Theme Colors
  static var dark = _DarkColors();
}

class _LightColors {
  _LightColors();

  final Color background = const Color(0xffFFFFFF);
  final Color surface = Colors.white;
  final Color textPrimary = const Color(0xff212121);
  final Color textSecondary = const Color(0xff757575);
  final Color card = const Color(0xFFF3F3F3);
}

class _DarkColors {
  _DarkColors();

  final Color background = const Color(0xFF121212);
  final Color surface = const Color(0xFF1E1E1E);
  final Color textPrimary = Colors.white;
  final Color textSecondary = const Color(0xFFF3F3F3);
  final Color card = const Color(0xFF1A1A1A);
}
