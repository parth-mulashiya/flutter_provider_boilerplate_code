import 'package:demo_app/core/network/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'core/constants/color_constants.dart';
import 'core/theme/theme_notifier.dart';
import 'l10n/app_localizations.dart';
import 'providers/second_provider.dart';
import 'routes/route_generator.dart';
import 'core/services/shared_prefs_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsService.init();
  configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ThemeNotifier()),
            ChangeNotifierProvider(create: (_) => ApiService()),

            ChangeNotifierProxyProvider<ApiService, SecondProvider>(
              create: (_) => SecondProvider(ApiService()),
              update:
                  (_, apiService, secondProvider) =>
                      secondProvider ?? SecondProvider(apiService),
            ),
          ],
          child: Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, _) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                theme: themeNotifier.currentTheme,
                routerConfig: RouterManager.router,
                builder: EasyLoading.init(),
                supportedLocales: const [
                  Locale('hi', ''),
                  Locale('gu', ''),
                  Locale('en', ''),
                ],
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  if (locale != null) {
                    for (var supportedLocale in supportedLocales) {
                      if (supportedLocale.languageCode == locale.languageCode) {
                        return supportedLocale;
                      }
                    }
                  }
                  return supportedLocales.first;
                },
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
