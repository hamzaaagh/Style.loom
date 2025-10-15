import 'package:dio/dio.dart';

class Api {
  final Dio _dio;
  final String baseUrl = 'http://localhost:3000/api/product';

  Api({required Dio dio}) : _dio = dio;
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    Response response = await _dio.get("$baseUrl$endpoint");
    return response.data;
  }

  Future<Response> post({
    required Map<String, dynamic> data,
    required String baseUrl,
    required String type,
  }) async {
    Response response = await _dio.post("$baseUrl$type", data: data);
    return response;
  }
}
