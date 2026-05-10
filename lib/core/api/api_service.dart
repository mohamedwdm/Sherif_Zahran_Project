import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000'; // For Android emulator. If you are testing on real device use your computer IP.

  static String fixUrl(String? url) {
    if (url == null || url.isEmpty) return '';
    // If the URL contains localhost, replace it with 10.0.2.2 for Android emulators
    if (url.contains('localhost')) {
      return url.replaceAll('localhost', '10.0.2.2');
    }
    if (url.contains('127.0.0.1')) {
      return url.replaceAll('127.0.0.1', '10.0.2.2');
    }
    return url;
  }

  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  ));
}
