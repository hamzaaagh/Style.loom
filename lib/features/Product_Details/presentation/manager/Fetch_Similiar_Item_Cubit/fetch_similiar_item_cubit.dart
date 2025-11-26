import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:style/core/Models/product_model/product_model.dart';

import 'package:style/features/Product_Details/data/Product_View_repo_Imp.dart';

part 'fetch_similiar_item_state.dart';

class FetchSimiliarItemCubit extends Cubit<FetchSimiliarItemState> {
  final ProductViewRepoImp productimp;
 
  FetchSimiliarItemCubit({ required this.productimp, })
    : super(FetchSimiliarItemInitial());
  Future<void> fetchSimiliarproductsitem({required ProductModel product,}) async {
    var result = await productimp.fetchsimiliarproducts(product: product);
    result.fold(
      (failure) {
        emit(FetchSimiliarItemFailure(errmessage: failure.errormessage));
      },
      (products) {
        emit(FetchSimiliarItemSucces(similiarproducts: products));
      },
    );
  }
}
