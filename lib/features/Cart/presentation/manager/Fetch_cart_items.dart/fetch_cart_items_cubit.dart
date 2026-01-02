import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:style/core/Models/cart/item.model.dart';


import 'package:style/features/Cart/Data/Cart_Repo_Imp.dart';

part 'fetch_cart_items_state.dart';

class FetchCartItemsCubit extends Cubit<FetchCartItemsState> {
  //final List<ProductModel> products = [];
  final CartRepoImp cartRepoImp;
  FetchCartItemsCubit({required this.cartRepoImp})
    : super(FetchCartItemsInitial());
  Future<void> fetchCartItems({required int userId}) async {
    emit(FetchCartItemsLoading());
    final result = await cartRepoImp.fetchCartItems(id: userId);
    result.fold(
      (failure) {
        emit(FetchCartItemsFailure(errorMessage: failure.errormessage));
      },
      (items) {
        emit(FetchCartItemsSuccess(items: items));
      },
    );
  }
}
