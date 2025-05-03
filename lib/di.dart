import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/network/api_service.dart';
import 'core/services/language_service.dart';
import 'core/theme/theme_notifier.dart';
import 'providers/second_provider.dart';

final LanguageService languageService = LanguageService();

final List<SingleChildWidget> globalProviders = [
  ChangeNotifierProvider(create: (_) => ThemeNotifier()),
  ChangeNotifierProvider(create: (_) => ApiService()),

  ChangeNotifierProvider<LanguageService>.value(value: languageService),

  ChangeNotifierProxyProvider<ApiService, SecondProvider>(
    create: (_) => SecondProvider(ApiService()),
    update:
        (_, apiService, secondProvider) =>
            secondProvider ?? SecondProvider(apiService),
  ),
];
