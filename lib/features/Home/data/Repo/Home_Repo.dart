import 'package:dartz/dartz.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/Models/product_model/sub_category.dart';
import 'package:style/core/utils/errors/failurs.dart';

abstract class HomeRepo {
  Future<Either<Failurs, List<SubCategory>>> fetchsubcategory({
    required int mainId,
  });
  Future<Either<Failurs, List<ProductModel>>> fetchproductmodel({
    required int mainId,
  });
}
