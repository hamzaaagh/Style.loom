import 'package:dartz/dartz.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/errors/failurs.dart';

abstract class ProductViewRepo {
  Future<Either<Failurs,List<ProductModel>>> fetchsimiliarproducts ({required int id});
}