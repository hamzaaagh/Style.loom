import 'package:dio/dio.dart';

abstract class Failurs {
  final String errormessage;

  Failurs({required this.errormessage});
}

class Serverfailur extends Failurs {
  Serverfailur({required super.errormessage});
  factory Serverfailur.fromDioexaption(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Serverfailur(errormessage: 'Connection Timeout Exception');
      case DioExceptionType.sendTimeout:
        return Serverfailur(errormessage: 'Send Timeout Exception');
      case DioExceptionType.receiveTimeout:
        return Serverfailur(errormessage: 'Receive Timeout Exception');
      case DioExceptionType.badResponse:
        return Serverfailur(
          errormessage: 'Invalid status: ${e.response?.statusCode}',
        );
      case DioExceptionType.cancel:
        return Serverfailur(errormessage: 'Request cancelled');
      default:
        return Serverfailur(errormessage: 'Something went wrong: ${e.message}');
    }
  }
}
