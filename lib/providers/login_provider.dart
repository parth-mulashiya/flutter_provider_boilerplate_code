import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String? _email;
  String? _password;

  bool get isLoading => _isLoading;
  String? get email => _email;
  String? get password => _password;

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  // Simulate a network login process
  Future<void> login() async {
    if (_email == null || _password == null) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    // Simulating network call with a delay
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();

    // Here you would typically return some result or throw an error
    // For demonstration, we're simulating a successful login
    // If needed, you can use a result like a token or navigate to the next screen
  }
}
