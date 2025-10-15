import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/utils/Api/api.dart';
import 'package:style/core/utils/errors/failurs.dart';
import 'package:style/features/Auth/data/Repo/Auth_Repo.dart';

class AuthRepoImp implements AuthRepo {
  final Api api;

  AuthRepoImp({required this.api});
  @override
  Future<Either<Failurs, Response>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await api.post(
        data: {'email': email, 'password': password},
        baseUrl: "http://localhost:3000/api/auth/",
        type: "login",
      );
      if (response.statusCode == 200) {
        return right(response);
      } else {
        return left(
          Serverfailur(
            errormessage:
                'Login failed with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailur.fromDioexaption(e));
      }
    }
    return left(Serverfailur(errormessage: "Something went wrong"));
  }

  @override
  Future<Either<Failurs, Response>> register({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
  }) async {
    try {
      var response = await api.post(
        data: {
          'first name': firstname,
          'last name': lastname,
          'email': email,
          'password': password,
        },
        baseUrl: "http://localhost:3000/api/auth/",
        type: "register",
      );
      if (response.statusCode == 200) {
        return right(response);
      } else {
        return left(
          Serverfailur(
            errormessage:
                'Registration failed with status code: ${response.statusCode}',
          ),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailur.fromDioexaption(e));
      }
    }
    return left(Serverfailur(errormessage: "Something went wrong"));
  }
}
