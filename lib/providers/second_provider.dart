import 'package:demo_app/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import '../core/network/api_service.dart';
import '../models/post_model.dart';

// Post model to parse the response data

class SecondProvider with ChangeNotifier {
  final ApiService _apiService;
  List<Post> _posts = [];
  bool _isLoading = false;
  String _error = '';

  // Getters
  List<Post> get posts => _posts;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Constructor
  SecondProvider(this._apiService);

  // Fetch all posts from JSONPlaceholder API
  Future<void> fetchAllPosts() async {
    try {
      _setLoading(true);
      _error = '';

      // Using the get method from ApiService
      final response = await _apiService.get(ApiConstants.baseUrl);

      if (response != null) {
        // Parse the response data
        final List<dynamic> responseData = response.data;
        _posts = responseData.map((json) => Post.fromJson(json)).toList();
        _setLoading(false);
        notifyListeners();
      } else {
        _setError('Failed to load posts');
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
    }
  }

  // Get a single post by ID
  Future<Post?> getPostById(int id) async {
    try {
      _setLoading(true);
      _error = '';

      final response = await _apiService.get('${ApiConstants.baseUrl}/$id');

      _setLoading(false);

      if (response != null) {
        return Post.fromJson(response.data);
      } else {
        _setError('Failed to load post with ID: $id');
        return null;
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
      return null;
    }
  }

  // Create a new post
  Future<Post?> createPost(String title, String body, int userId) async {
    try {
      _setLoading(true);
      _error = '';

      final response = await _apiService.post(ApiConstants.baseUrl, {
        'title': title,
        'body': body,
        'userId': userId,
      });

      _setLoading(false);

      if (response != null) {
        final newPost = Post.fromJson(response.data);
        _posts.add(newPost);
        notifyListeners();
        return newPost;
      } else {
        _setError('Failed to create post');
        return null;
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
      return null;
    }
  }

  // Update an existing post
  Future<Post?> updatePost(int id, String title, String body) async {
    try {
      _setLoading(true);
      _error = '';

      final response = await _apiService.put('${ApiConstants.baseUrl}/$id', {
        'id': id,
        'title': title,
        'body': body,
      });

      _setLoading(false);

      if (response != null) {
        final updatedPost = Post.fromJson(response.data);
        final index = _posts.indexWhere((post) => post.id == id);
        if (index != -1) {
          _posts[index] = updatedPost;
          notifyListeners();
        }
        return updatedPost;
      } else {
        _setError('Failed to update post');
        return null;
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
      return null;
    }
  }

  // Delete a post
  Future<bool> deletePost(int id) async {
    try {
      _setLoading(true);
      _error = '';

      final response = await _apiService.delete('${ApiConstants.baseUrl}/$id');

      _setLoading(false);

      if (response != null) {
        _posts.removeWhere((post) => post.id == id);
        notifyListeners();
        return true;
      } else {
        _setError('Failed to delete post');
        return false;
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
      return false;
    }
  }

  // Helper methods
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String errorMessage) {
    _error = errorMessage;
    _isLoading = false;
    notifyListeners();
  }

  // Clear posts
  void clearPosts() {
    _posts = [];
    notifyListeners();
  }
}
