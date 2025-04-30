// lib/screens/home_screen.dart

import 'package:demo_app/core/constants/api_constants.dart';
import 'package:demo_app/core/network/api_service.dart';
import 'package:demo_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Import routes for navigation

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _responseData = 'No data yet';
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Set context for navigation
    Provider.of<ApiService>(context).setContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              context.pushReplacementNamed(AppRoutesNames.login);
            },
          ),
        ],
      ),
      body: Consumer<ApiService>(
        builder: (context, apiService, child) {
          _isLoading = apiService.isLoading;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the Home Screen!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  Text(_responseData),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final response = await apiService.get(
                      "${ApiConstants.baseUrl}/1",
                    );

                    if (response != null) {
                      _responseData = response.data.toString();
                    }
                  },
                  child: const Text('Make GET Request'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final response = await apiService.post(
                      ApiConstants.baseUrl,
                      {'title': 'foo', 'body': 'bar', 'userId': 1},
                    );

                    if (response != null) {
                      _responseData = response.data.toString();
                    }
                  },
                  child: const Text('Make POST Request'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(AppRoutesNames.about);
                  },
                  child: const Text('Go to About Page'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    context.pushNamed(AppRoutesNames.second);
                  },
                  child: const Text('All Post'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
