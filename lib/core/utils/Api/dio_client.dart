import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:style/core/Consts/const_Ip_Adress.dart';

class DioClient {
  static final FlutterSecureStorage storage = const FlutterSecureStorage();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://${IPconsts.ipadress}:3000/api/',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  static void setupInterceptors() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsImVtYWlsIjoiYWhtYWRoc3NzMTIzNEBnbWFpbC5jb20iLCJyb2xlIjoidXNlciIsImlhdCI6MTc2NzYxMzQxMn0.5y-rfnbp5P1_24d04m9H9jr5q_5S8PMRgCYdytN2IeA";
         
            options.headers['Authorization'] = 'Bearer $token';
          
          return handler.next(options);
        },
      ),
    );
  }
}
