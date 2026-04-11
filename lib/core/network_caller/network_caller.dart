import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final dynamic responseData;
  final String errorMessage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.responseData,
    this.errorMessage = 'Something went wrong!',
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  String? _token;

  // ===========================
  // 🔹 SET TOKEN (for auth)
  // ===========================
  void updateToken(String token) {
    _token = token;
  }

  // ===========================
  // 🔹 HEADERS
  // ===========================
  Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      if (_token != null) 'token': _token!,
    };
  }

  // ===========================
  // 🔹 GET
  // ===========================
  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, _headers());

      final response = await http
          .get(uri, headers: _headers())
          .timeout(const Duration(seconds: 30));

      _logResponse(url, response);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // ===========================
  // 🔹 POST
  // ===========================
  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, _headers(), requestBody: body);

      final response = await http
          .post(uri, headers: _headers(), body: jsonEncode(body))
          .timeout(const Duration(seconds: 30));

      _logResponse(url, response);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // ===========================
  // 🔹 PUT
  // ===========================
  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, _headers(), requestBody: body);

      final response = await http
          .put(uri, headers: _headers(), body: jsonEncode(body))
          .timeout(const Duration(seconds: 30));

      _logResponse(url, response);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // ===========================
  // 🔹 PATCH
  // ===========================
  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, _headers(), requestBody: body);

      final response = await http
          .patch(uri, headers: _headers(), body: jsonEncode(body))
          .timeout(const Duration(seconds: 30));

      _logResponse(url, response);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // ===========================
  // 🔹 DELETE
  // ===========================
  Future<NetworkResponse> deleteRequest({
    required String url,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      _logRequest(url, _headers());

      final response = await http
          .delete(uri, headers: _headers())
          .timeout(const Duration(seconds: 30));

      _logResponse(url, response);

      return _handleResponse(response);
    } catch (e) {
      return _handleError(e);
    }
  }

  // ===========================
  // 🔹 RESPONSE HANDLER
  // ===========================
  NetworkResponse _handleResponse(http.Response response) {
    dynamic decodedBody;

    try {
      decodedBody =
      response.body.isNotEmpty ? jsonDecode(response.body) : null;
    } catch (e) {
      decodedBody = response.body;
    }

    String message = 'Request failed';

    if (decodedBody is Map) {
      message = decodedBody['message'] ??
          decodedBody['msg'] ??
          'Request failed';
    }

    if (response.statusCode >= 200 && response.statusCode <= 299) {
      return NetworkResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseData: decodedBody,
      );
    } else if (response.statusCode == 401) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: 401,
        errorMessage: 'Unauthorized',
      );
    } else {
      return NetworkResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseData: decodedBody,
        errorMessage: message,
      );
    }
  }

  // ===========================
  // 🔹 ERROR HANDLER
  // ===========================
  NetworkResponse _handleError(dynamic e) {
    _logger.e('Error => $e');

    String message = 'Something went wrong';

    if (e is SocketException) {
      message = 'No internet connection';
    } else if (e.toString().contains('TimeoutException')) {
      message = 'Request timeout. Try again.';
    }

    return NetworkResponse(
      isSuccess: false,
      statusCode: -1,
      errorMessage: message,
    );
  }

  // ===========================
  // 🔹 LOGGER
  // ===========================
  void _logRequest(
      String url,
      Map<String, String> headers, {
        Map<String, dynamic>? requestBody,
      }) {
    _logger.i(
      "REQUEST =>\nURL: $url\nHeaders: $headers\nBody: $requestBody",
    );
  }

  void _logResponse(String url, http.Response response) {
    _logger.i(
      "RESPONSE =>\nURL: $url\nStatus: ${response.statusCode}\nBody: ${response.body}",
    );
  }
}