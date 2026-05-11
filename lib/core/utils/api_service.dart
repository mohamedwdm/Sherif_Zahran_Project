import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiService {
  final Dio _dio;

  final String _baseUrl = kIsWeb ? "http://localhost:8000" : "http://10.0.2.2:8000";

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    print('Calling API: $_baseUrl$endpoint');
    var response = await _dio.post(
      '$_baseUrl$endpoint',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    print('Response status: ${response.statusCode}');
    return response.data;
  }
  Future<Map<String, dynamic>> get({
    required String endpoint,
  }) async {
    print('Calling API: $_baseUrl$endpoint');
    var response = await _dio.get(
      '$_baseUrl$endpoint',
    );
    print('Response status: ${response.statusCode}');
    return response.data;
  }
}
