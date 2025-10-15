import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/utils/errors/failurs.dart';

abstract class AuthRepo {
  Future<Either<Failurs, Response>> login({
    required String email,
    required String password,
  });
  Future<Either<Failurs, Response>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  });
}
