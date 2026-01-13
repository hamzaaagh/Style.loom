import 'package:dartz/dartz.dart';
import 'package:style/core/Models/cart/item.model.dart';

import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/errors/failurs.dart';

abstract class CartRepo {
  Future<Either<Failurs, void>> addToCart({
    required ProductModel product,
    required int userId,
    required int quantity,
  });
  Future<Either<Failurs, List<Item>>> fetchCartItems({required int id});
  Future<Either<Failurs, void>> removeFromCart({
    required Item product,
    required int userId,
  });
}
