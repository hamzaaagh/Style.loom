import 'package:dio/dio.dart';

import 'package:style/core/utils/Api/dio_client.dart';

class Api {
   final Dio _dio = DioClient.dio;
  Future<Response> get({required String endpoint}) async {
    Response response = await _dio.get(
      endpoint,
     
    );
    return response;
  }

  Future<Response> post({
    required Map<String, dynamic> data,
    required String baseUrl,
    required String type,
  }) async {
    Response response = await _dio.post("$baseUrl$type", data: data);
    return response;
  }

  Future<Response> delete({
    required Map<String, dynamic> data,
    required String baseUrl,
    required String type,
  }) async {
    Response response = await _dio.delete("$baseUrl$type", data: data);
    return response;
  }
}
