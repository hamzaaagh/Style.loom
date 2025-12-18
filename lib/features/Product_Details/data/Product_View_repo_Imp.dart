
import 'package:dartz/dartz.dart';
import 'package:style/core/Models/product_model/product_model.dart';

import 'package:style/core/utils/Api/api.dart';
import 'package:style/core/utils/errors/failurs.dart';
import 'Product_View_repo.dart';

class ProductViewRepoImp implements ProductViewRepo {
  final Api api;

  ProductViewRepoImp({required this.api});

  @override
  Future<Either<Failurs, List<ProductModel>>> fetchsimiliarproducts({
    required ProductModel product,
  }) async {
    try {
      // Fetch all products
      var response = await api.get(endpoint: "product");

      List<ProductModel> products = [];

      for (var item in response.data) {
        products.add(ProductModel.fromJson(item));
      }

      // Extract IDs for filtering
      final mainId = product.subCategory?.main?.id;
      final subId = product.subCategory?.id;

      List<ProductModel> similar = [];

      for (var item in products) {
        // Ignore the same product
        if (item.id == product.id) continue;

        final itemMainId = item.subCategory?.main?.id;
        final itemSubId = item.subCategory?.id;

        // Match by main category OR sub category
        if ((mainId != null && itemMainId == mainId) ||
            (subId != null && itemSubId == subId)) {
          similar.add(item);
        }
      }

      return Right(similar);
    } catch (e) {
      return Left(Serverfailur( errormessage: e.toString()));
    }
  }

  Future<Either<Failurs, ProductModel>> fetchproductdetials({
    required int id,
  }) async {
    try {
      var response = await api.get(endpoint: "product/$id");
      ProductModel item = ProductModel.fromJson(response.data);
      return Right(item);
    } catch (e) {
      return Left(Serverfailur(errormessage: e.toString()));
    }
  }
}
