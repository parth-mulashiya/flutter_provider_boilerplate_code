import 'package:demo_app/core/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/constants/color_constants.dart';
import 'core/services/language_service.dart';
import 'core/theme/theme_notifier.dart';
import 'providers/second_provider.dart';
import 'routes/route_generator.dart';
import 'core/services/shared_prefs_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.init();
  configLoading();

  // Preload LanguageService and fetch translations
  final languageService = LanguageService();
  await languageService.fetchTranslations();
  runApp(MyApp(languageService: languageService));
}

class MyApp extends StatelessWidget {
  final LanguageService languageService;
  const MyApp({super.key, required this.languageService});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeNotifier()),
            ChangeNotifierProvider(create: (_) => ApiService()),

            ChangeNotifierProvider<LanguageService>.value(
              value: languageService,
            ),

            ChangeNotifierProxyProvider<ApiService, SecondProvider>(
              create: (_) => SecondProvider(ApiService()),
              update:
                  (_, apiService, secondProvider) =>
                      secondProvider ?? SecondProvider(apiService),
            ),
          ],
          child: Consumer2<ThemeNotifier, LanguageService>(
            builder: (context, themeNotifier, languageService, _) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: themeNotifier.currentTheme,
                routerConfig: RouterManager.router,
                builder: EasyLoading.init(),
                locale: languageService.currentLocale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('hi'),
                  Locale('gu'),
                ],
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          ),
        );
      },
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingFour
    ..loadingStyle = EasyLoadingStyle.light
    ..radius = 10.0
    ..indicatorColor = ColorConstants.primaryColor
    ..progressColor = Colors.deepPurpleAccent
    ..textColor = const Color(0xFF64DEE0)
    ..backgroundColor = Colors.white
    ..maskType = EasyLoadingMaskType.clear
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
