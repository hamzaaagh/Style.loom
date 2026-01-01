import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/Api/api.dart';
import 'package:style/core/utils/errors/failurs.dart';
import 'package:style/features/Cart/Data/Cart_Repo.dart';

class CartRepoImp implements CartRepo {
  final Api api;

  const CartRepoImp({required this.api});
  @override
  Future<Either<Failurs, void>> addToCart({
    required ProductModel product,
    required int userId,
    required int quantity,
  }) async {
    try {
      var response = await api.post(
        data: {"userId": userId, "productId": product.id, "quantity": quantity},
        baseUrl: "http://localhost:3000/api/",
        type: "cart",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(null);
      } else {
        return left(
          Serverfailur(
            errormessage: "Failed to add to cart ${response.statusCode}",
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
  Future<Either<Failurs, List<ProductModel>>> getCartItems({
    required int id,
  }) async {
    try {
      var response = await api.get(endpoint: "cart/$id");
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ProductModel> products = [];
        for (var item in response.data) {
          products.add(ProductModel.fromJson(item));
        }
        return right(products);
      } else {
        return left(
          Serverfailur(
            errormessage: "Failed to get cart items ${response.statusCode}",
          ),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailur.fromDioexaption(e));
      }
      return left(Serverfailur(errormessage: "Something went wrong"));
    }
  }

  @override
  Future<Either<Failurs, void>> removeFromCart({
    required ProductModel product,
    required int userId,
  }) async {
    try {
      var response = await api.delete(
        data: {"userId": userId, "productId": product.id},
        baseUrl: "http://localhost:3000/api/",
        type: "cart/removeFromCart",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return right(null);
      }
      return left(
        Serverfailur(
          errormessage: "Failed to remove from cart ${response.statusCode}",
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return left(Serverfailur.fromDioexaption(e));
      }
      return left(Serverfailur(errormessage: "Something went wrong"));
    }
  }
}
