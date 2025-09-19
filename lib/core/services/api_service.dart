import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/api',
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Response> getData(
    String endpoint, {
    Map<String, dynamic>? headers,
  }) async {
    return await _dio.get(endpoint, options: Options(headers: headers));
  }

  Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
    return await _dio.post(endpoint, data: data);
  }

  // put, delete...
}
