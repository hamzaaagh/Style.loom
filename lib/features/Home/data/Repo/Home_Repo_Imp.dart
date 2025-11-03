import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/Models/product_model/main_category.dart';
import 'package:style/core/Models/product_model/product_model.dart';

import 'package:style/core/utils/Api/api.dart';
import 'package:style/core/utils/errors/failurs.dart';
import 'package:style/features/Home/data/Repo/Home_Repo.dart';

class HomeRepoImp extends HomeRepo {
  final Api api;

  HomeRepoImp({required this.api});
  @override
  Future<Either<Failurs, List<ProductModel>>> fetchproductmodel({
    int mainId = 0,
  }) async {
    var response = await api.get(endpoint: "product");
    try {
      if (response.statusCode == 200) {
        List<ProductModel> products = [];
        for (var item in response.data) {
          if (mainId == 0) {
            products.add(ProductModel.fromJson(item));
          } else if (item["subCategory"]["mainId"] == mainId) {
            products.add(ProductModel.fromJson(item));
          }
        }
        return right(products);
      } else {
        return left(
          Serverfailur(
            errormessage:
                'Failed to fetch products with status code: ${response.statusCode}',
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
  Future<Either<Failurs, List<MainCategory>>> fetchsubcategory({
    required int mainId,
  }) async {
    var response = await api.get(endpoint: "categories/main/");
    try {
      if (response.statusCode == 200) {
        
        List<MainCategory> subcategories = [];
        for (var item in response.data) {
          if (mainId == 0) {
            subcategories.add(MainCategory.fromJson(item));
          } else if (item["subCategories"][0]["mainId"] == mainId) {
            subcategories.add(MainCategory.fromJson(item));
          }
        }
        return right(subcategories);
      } else {
        return left(
          Serverfailur(
            errormessage:
                'Failed to fetch subcategories with status code: ${response.statusCode}',
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
