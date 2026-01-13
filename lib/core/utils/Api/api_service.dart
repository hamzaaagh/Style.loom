import 'package:dio/dio.dart';

import 'package:style/core/utils/Api/dio_client.dart';

class Api {
  final Dio _dio = DioClient.dio;
  void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Future<Response> get({required String endpoint}) async {
    

    return await _dio.get(endpoint);
  }

  Future<Response> post({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    return await _dio.post(endpoint, data: data);
  }

  Future<Response> delete({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    return await _dio.delete(endpoint, data: data);
  }
}
