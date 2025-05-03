import 'package:demo_app/core/constants/lang_constants.dart';
import 'package:demo_app/core/extensions/core_extenstion.dart';
import 'package:demo_app/core/extensions/lang_extension.dart';
import 'package:demo_app/core/extensions/padding_extension.dart';
import 'package:demo_app/core/services/language_service.dart';
import 'package:demo_app/routes/app_routes.dart';
import 'package:demo_app/utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme/theme_notifier.dart';
import '../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final langauge = Provider.of<LanguageService>(context, listen: false);
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Consumer2<LoginProvider, LanguageService>(
        builder: (context, loginProvider, languageService, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                context.tr(LangConst.appName),
                style: TextStyle(fontSize: 24),
              ),
              actions: [
                Consumer<ThemeNotifier>(
                  builder: (context, themeNotifier, child) {
                    return IconButton(
                      icon: Icon(
                        themeNotifier.isDark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        size: 24,
                      ),
                      onPressed: () {
                        themeNotifier.toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
            backgroundColor: context.theme.scaffoldBackgroundColor,
            body: Padding(
              padding: EdgeInsets.all(
                ResponsiveUtil.isDesktop(context)
                    ? 120.0
                    : ResponsiveUtil.isTablet(context)
                    ? 40.0
                    : 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.tr(LangConst.welcomeMessage),
                    style: context.textTheme.displaySmall,
                  ),
                  16.heightBox,
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: loginProvider.email,
                          onChanged: (value) {
                            loginProvider.setEmail(value);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(
                              r'^[^@]+@[^@]+\.[^@]+',
                            ).hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        16.heightBox,
                        TextFormField(
                          initialValue: loginProvider.password,
                          onChanged: (value) {
                            loginProvider.setPassword(value);
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                        24.heightBox,
                        loginProvider.isLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                              onPressed: () async {
                                await loginProvider.login();
                                if (!loginProvider.isLoading) {
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //     content: Text('Login successful!'),
                                  //   ),
                                  // );

                                  if (context.mounted) {
                                    context.pushReplacement(AppRoutes.home);
                                  }
                                }
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                langauge.changeLanguage(const Locale('en'));
                              },
                              child: Text('A'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                langauge.changeLanguage(const Locale('hi'));
                              },
                              child: Text('अ'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                langauge.changeLanguage(const Locale('gu'));
                              },
                              child: Text('અ'),
                            ),
                          ],
                        ).paddingTop(30),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
