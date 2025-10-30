import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Models/product_model/sub_category.dart';
import 'package:style/core/utils/Api/api.dart';
import 'package:style/core/utils/errors/failurs.dart';
import 'package:style/features/Home/data/Repo/Home_Repo.dart';

class HomeRepoImp extends HomeRepo {
  final Api api;

  HomeRepoImp({required this.api});
  @override
  Future<Either<Failurs, List<ProductModel>>> fetchproductmodel({
    required int mainId,
  }) async {
    var response = await api.get(endpoint: "categories/main/");
    try {
      if (response.statusCode == 200) {
        List<ProductModel> products = [];
        for (var item in response.data) {
          if (item["mainId"] != mainId) continue;
          products.add(ProductModel.fromJson(item));
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
  Future<Either<Failurs, List<SubCategory>>> fetchsubcategory({
    required int mainId,
  }) async {
    var response = await api.get(endpoint: "categories/main/");
    try {
      if (response.statusCode == 200) {
        List<SubCategory> subcategories = [];
        for (var item in response.data) {
          if (item["mainId"] != mainId) continue;
          subcategories.add(SubCategory.fromJson(item));
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
