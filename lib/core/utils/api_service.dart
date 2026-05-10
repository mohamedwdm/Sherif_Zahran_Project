import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;

  final String _baseUrl = "http://10.0.2.2:8000";

  ApiService(this._dio);

  Future<Map<String, dynamic>> post({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    var response = await _dio.post(
      '$_baseUrl$endpoint',
      data: body,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
    return response.data;
  }
}
