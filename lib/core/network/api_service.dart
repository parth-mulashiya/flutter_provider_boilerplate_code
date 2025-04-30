import 'package:dio/dio.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../routes/app_routes.dart';

// class ApiService {
//   final Dio _dio = Dio();

//   Future<Response> getRequest(
//     String url, {
//     Map<String, dynamic>? params,
//   }) async {
//     return await _dio.get(url, queryParameters: params);
//   }

//   Future<Response> postRequest(String url, dynamic data) async {
//     return await _dio.post(url, data: data);
//   }

//   Future<Response> putRequest(String url, dynamic data) async {
//     return await _dio.put(url, data: data);
//   }

//   Future<Response> deleteRequest(String url) async {
//     return await _dio.delete(url);
//   }
// }

class ApiService with ChangeNotifier {
  final Dio _dio = Dio();
  bool _isLoading = false;
  BuildContext? _context;

  bool get isLoading => _isLoading;

  // Set the BuildContext for navigation
  void setContext(BuildContext context) {
    _context = context;
  }

  ApiService() {
    _initDio();
  }

  void _initDio() {
    // Configure Dio instance with default settings
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.sendTimeout = const Duration(seconds: 30);
    _dio.options.responseType = ResponseType.json;

    // Add interceptors for logging, auth token, etc.
    _dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        // logPrint: (object) => log(object.toString()),
      ),
    );
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // Handle Dio exceptions
  void _handleException(DioException error) {
    EasyLoading.dismiss();

    String errorMessage = 'An error occurred';

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Connection timeout occurred';
        break;
      case DioExceptionType.connectionError:
        errorMessage = 'No internet connection';
        if (_context != null) {
          // Check current route before navigating
          ModalRoute? route = ModalRoute.of(_context!);
          if (route?.settings.name != AppRoutes.noNetwork) {
            Navigator.pushReplacementNamed(_context!, AppRoutes.noNetwork);
          }
        }
        break;
      case DioExceptionType.badResponse:
        errorMessage =
            'Error ${error.response?.statusCode}: ${error.response?.statusMessage}';
        break;
      case DioExceptionType.cancel:
        errorMessage = 'Request was cancelled';
        break;
      case DioExceptionType.unknown:
        if (error.message?.contains('SocketException') == true) {
          errorMessage = 'No internet connection';
          if (_context != null) {
            // Check current route before navigating
            ModalRoute? route = ModalRoute.of(_context!);
            if (route?.settings.name != AppRoutes.noNetwork) {
              Navigator.pushReplacementNamed(_context!, AppRoutes.noNetwork);
            }
          }
          break;
        }
        errorMessage = error.message ?? 'Unknown error occurred';
        break;
      default:
        errorMessage = error.message ?? 'Unknown error occurred';
        break;
    }

    EasyLoading.show(
      status: errorMessage,
      indicator: const Icon(Icons.info_rounded, color: Colors.red, size: 64),
      dismissOnTap: true,
      maskType: EasyLoadingMaskType.black,
    );
  }

  // GET Method
  Future<Response?> get(String path, {Map<String, dynamic>? query}) async {
    try {
      _setLoading(true);
      final response = await _dio.get(path, queryParameters: query);
      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error: $e');
      EasyLoading.showError('Unexpected error occurred');
      return null;
    }
  }

  // POST Method
  Future<Response?> post(String path, dynamic data) async {
    try {
      _setLoading(true);
      final response = await _dio.post(path, data: data);
      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error: $e');
      EasyLoading.showError('Unexpected error occurred');
      return null;
    }
  }

  // PUT Method
  Future<Response?> put(String path, dynamic data) async {
    try {
      _setLoading(true);
      final response = await _dio.put(path, data: data);
      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error: $e');
      EasyLoading.showError('Unexpected error occurred');
      return null;
    }
  }

  // DELETE Method
  Future<Response?> delete(String path, {dynamic data}) async {
    try {
      _setLoading(true);
      final response = await _dio.delete(path, data: data);
      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error: $e');
      EasyLoading.showError('Unexpected error occurred');
      return null;
    }
  }

  // UPLOAD File Method
  Future<Response?> uploadFile(
    String path,
    String keyName,
    File file, {
    Map<String, dynamic>? extraData,
  }) async {
    try {
      _setLoading(true);

      String fileName = file.path.split('/').last;
      String mimeType = _getMimeType(fileName);

      FormData formData = FormData();

      // Add file to form data
      formData.files.add(
        MapEntry(
          keyName,
          await MultipartFile.fromFile(
            file.path,
            filename: fileName,
            contentType: DioMediaType.parse(mimeType),
          ),
        ),
      );

      // Add any extra data
      if (extraData != null) {
        extraData.forEach((key, value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }

      final response = await _dio.post(
        path,
        data: formData,
        options: Options(
          headers: {
            "Connection": "keep-alive",
            "Content-Type": "multipart/form-data",
          },
        ),
      );

      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error during file upload: $e');
      EasyLoading.showError('Unexpected error during file upload');
      return null;
    }
  }

  // Helper method to determine MIME type
  String _getMimeType(String fileName) {
    if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
      return 'image/jpeg';
    } else if (fileName.endsWith('.png')) {
      return 'image/png';
    } else if (fileName.endsWith('.pdf')) {
      return 'application/pdf';
    } else if (fileName.endsWith('.csv')) {
      return 'text/csv';
    } else {
      return 'application/octet-stream';
    }
  }

  // PATCH Method
  Future<Response?> patch(String path, dynamic data) async {
    try {
      _setLoading(true);
      final response = await _dio.patch(path, data: data);
      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error: $e');
      EasyLoading.showError('Unexpected error occurred');
      return null;
    }
  }

  // Download file method
  Future<File?> downloadFile(String url, String savePath) async {
    try {
      _setLoading(true);
      await _dio.download(
        url,
        savePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).toStringAsFixed(0);
            EasyLoading.showProgress(
              received / total,
              status: 'Downloading $progress%',
            );
          }
        },
      );
      _setLoading(false);
      EasyLoading.dismiss();
      return File(savePath);
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error during download: $e');
      EasyLoading.showError('Unexpected error during download');
      return null;
    }
  }

  // For stream responses
  Future<Stream<Response>?> getStream(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    try {
      _setLoading(true);
      final response =
          _dio
              .get(
                path,
                queryParameters: query,
                options: Options(responseType: ResponseType.stream),
              )
              .asStream();
      _setLoading(false);
      return response;
    } on DioException catch (e) {
      _setLoading(false);
      _handleException(e);
      return null;
    } catch (e) {
      _setLoading(false);
      log('Unexpected error: $e');
      EasyLoading.showError('Unexpected error occurred');
      return null;
    }
  }

  // Method to add auth token
  void setAuthToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  // Method to clear auth token
  void clearAuthToken() {
    _dio.options.headers.remove('Authorization');
  }
}
