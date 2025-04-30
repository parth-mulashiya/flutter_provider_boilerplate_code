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
  bool get hasMorePosts => _hasMorePosts;
  bool get isFetchingMore => _isFetchingMore;
  int get currentPage => _currentPage;

  // Constructor
  SecondProvider(this._apiService);

  int _currentPage = 1;
  final int _postsPerPage = 10;
  bool _hasMorePosts = true;
  bool _isFetchingMore = false;

  void _setFetchingMore(bool fetching) {
    _isFetchingMore = fetching;
    notifyListeners();
  }

  // Fetch all posts from JSONPlaceholder API
  Future<void> fetchAllPosts({bool refresh = false}) async {
    try {
      // If refreshing, reset pagination state
      if (refresh) {
        _currentPage = 1;
        _hasMorePosts = true;
        _posts = [];
        _setLoading(true);
      } else if (_isFetchingMore) {
        // Prevent multiple pagination requests
        return;
      } else if (!_hasMorePosts) {
        // No more posts to fetch
        return;
      }

      // Set appropriate loading state
      if (_currentPage == 1) {
        _setLoading(true);
      } else {
        _setFetchingMore(true);
      }

      _error = '';

      // Construct URL with pagination parameters
      final url =
          '${ApiConstants.baseUrl}?_page=$_currentPage&_limit=$_postsPerPage';

      // Using the get method from ApiService
      final response = await _apiService.get(url);

      if (response != null) {
        // Parse the response data
        final List responseData = response.data;

        // Check if we've reached the end of available posts
        if (responseData.isEmpty) {
          _hasMorePosts = false;
        } else {
          // Convert JSON to Post objects
          final newPosts =
              responseData.map((json) => Post.fromJson(json)).toList();

          // If refreshing or first page, replace posts; otherwise, add to existing list
          if (refresh || _currentPage == 1) {
            _posts = newPosts;
          } else {
            _posts.addAll(newPosts);
          }

          // Increment page for next fetch
          _currentPage++;
        }

        _setLoading(false);
        _setFetchingMore(false);
        notifyListeners();
      } else {
        _setError('Failed to load posts');
      }
    } catch (e) {
      _setError('An error occurred: ${e.toString()}');
      _setFetchingMore(false);
    }
  }

  // Add a method to load more posts when scrolling
  Future<void> loadMorePosts() async {
    if (!_isLoading && !_isFetchingMore && _hasMorePosts) {
      await fetchAllPosts();
    }
  }

  // Reset method for refreshing
  void refreshPosts() {
    fetchAllPosts(refresh: true);
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
