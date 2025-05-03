import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/language_service.dart';

extension TranslationExtension on BuildContext {
  String tr(String key) {
    return Provider.of<LanguageService>(this, listen: false).translate(key);
  }
}
