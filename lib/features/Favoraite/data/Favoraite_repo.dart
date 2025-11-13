import 'package:style/core/Models/product_model/product_model.dart';

abstract class FavoraiteRepo {
  void addToFavoraite(ProductModel product);
  void removeFromFavoraite(ProductModel product);
  List<ProductModel> getFavoraiteItems();
}