import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/core/utils/errors/failurs.dart';

abstract class FavoraiteRepo {
  Future<Either<Failurs,Response>> addToFavoraite(ProductModel product,int userId);
  Future<void> removeFromFavoraite(ProductModel product);
  Future<List<ProductModel>> getFavoraiteItems();
}