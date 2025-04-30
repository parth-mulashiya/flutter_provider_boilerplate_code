import 'package:flutter/material.dart';

import 'color_constants.dart';

class CommonConstants {
  static const String appName = 'MyApp';
  static const String appVersion = '1.0.0';
  static const String apiBaseUrl = 'https://api.example.com/';
  static const String defaultLanguage = 'en';
  static const int defaultTimeout = 30;

  static BoxShadow boxShadow = BoxShadow(
    color: ColorConstants.shadow,
    blurRadius: 5,
    spreadRadius: 0,
    offset: Offset(2.34, 2.34),
  );
}
