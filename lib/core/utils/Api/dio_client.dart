import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:style/core/Consts/const_Ip_Adress.dart';


class DioClient {
  static final FlutterSecureStorage storage =
      const FlutterSecureStorage();

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
          final token = await storage.read(key: 'token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );
  }
}