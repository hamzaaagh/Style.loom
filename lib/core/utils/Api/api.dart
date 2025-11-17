import 'package:dio/dio.dart';

class Api {
  final Dio _dio;
  final String baseUrl = 'http://10.3.73.102:3000/api/';
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiZW1haWwiOiJtaGFAZ21haWwuY29tIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3NjA0NDc4NTN9.kP7lvyzP91ak0mBLA2paePwfBLzuFxQJ5qTiTaahKqU";
  Api({required Dio dio}) : _dio = dio;
  Future<Response> get({required String endpoint}) async {
    Response response = await _dio.get(
      "$baseUrl$endpoint",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
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
}
