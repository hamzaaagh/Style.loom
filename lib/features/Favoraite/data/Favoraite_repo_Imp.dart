import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/Api/api.dart';
import 'package:style/core/utils/errors/failurs.dart';
import 'package:style/features/Favoraite/data/Favoraite_repo.dart';

class FavoraiteRepoImp implements FavoraiteRepo {
  List<ProductModel> favoraiteItems = [];
  final Api api;

  FavoraiteRepoImp({required this.api});
  @override
  Future<Either<Failurs, Response>> addToFavoraite(
    ProductModel product,
    int userId,
  ) async {
    try {
      var response = await api.post(
        data: {"userId": userId, "productId": product.id},
        baseUrl: "http://localhost:3000/api/product/",
        type: "addFavorite",
      );
      if (response.statusCode == 200) {
        favoraiteItems.add(product);
        return right(response);
      } else {
        return left(
          Serverfailur(
            errormessage: "Failed to add to favoriate ${response.statusCode}",
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
  Future<List<ProductModel>> getFavoraiteItems() {
    // TODO: implement getFavoraiteItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failurs, Response>> removeFromFavoraite(
    ProductModel product,
    int userId,
  ) async {
    try {
      var response = await api.delete(
        data: {"userId": userId, "productId": product.id},
        baseUrl: "http://localhost:3000/api/product/",
        type: "removeFavorite",
      );
      if (response.statusCode == 200) {
        favoraiteItems.remove(product);
        return right(response);
      } else {
        return left(
          Serverfailur(
            errormessage: "Failed to remove favoriate ${response.statusCode}",
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
