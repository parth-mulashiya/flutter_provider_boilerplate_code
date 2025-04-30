import 'package:demo_app/routes/app_routes.dart';
import 'package:demo_app/utils/responsive_util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme/theme_notifier.dart';
import '../l10n/app_localizations.dart';
import '../providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Login'),
              actions: [
                Consumer<ThemeNotifier>(
                  builder: (context, themeNotifier, child) {
                    return IconButton(
                      icon: Icon(
                        themeNotifier.isDark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                      ),
                      onPressed: () {
                        themeNotifier.toggleTheme();
                      },
                    );
                  },
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(
                ResponsiveUtil.isDesktop(context)
                    ? 60.0
                    : ResponsiveUtil.isDesktop(context)
                    ? 40.0
                    : 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context).welcomeBack,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
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
                        const SizedBox(height: 16),
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
                        const SizedBox(height: 24),
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
                                    context.push(AppRoutes.home);
                                  }
                                }
                              },
                              child: const Text('Login'),
                            ),
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
