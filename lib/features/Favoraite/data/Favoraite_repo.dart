import 'package:dartz/dartz.dart';

import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/errors/failurs.dart';

abstract class FavoraiteRepo {
  Future<Either<Failurs, void>> addToFavoraite(
    ProductModel product,
    int userId,
  );
  Future<Either<Failurs, void>> removeFromFavoraite(
    ProductModel product,
    int userId,
  );
  Future<Either<Failurs, List<ProductModel>>> getFavoraiteItems(int id);
}
