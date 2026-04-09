import 'package:dio/dio.dart';

import '../values/api_endpoints.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = ApiEndpoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
    _dio.options.receiveDataWhenStatusError = true;
  }

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    _dio.options.headers = {
      if (token != null) 'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await _dio.get(endPoint, queryParameters: queryParameters);
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    _dio.options.headers = {
      if (token != null) 'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final response = await _dio.post(
      endPoint,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
