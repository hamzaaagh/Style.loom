import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Favoraite/data/Favoraite_repo.dart';

class FavoraiteRepoImp implements FavoraiteRepo {
    List<ProductModel> favoraiteItems = [];

@override
  void addToFavoraite(ProductModel product) {
    if (!favoraiteItems.contains(product)) {
      favoraiteItems.add(product);
    }
  }

  @override

  void removeFromFavoraite(ProductModel product) {
    favoraiteItems.remove(product);
  }

@override

  List<ProductModel> getFavoraiteItems() {
    return List<ProductModel>.from(favoraiteItems);
  } 


  bool isFav(ProductModel product) {
    return favoraiteItems.contains(product);
  }

}
