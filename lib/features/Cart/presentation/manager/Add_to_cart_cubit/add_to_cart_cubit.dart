import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:style/core/Models/product_model/product_model.dart';
import 'package:style/features/Cart/Data/Cart_Repo_Imp.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  final CartRepoImp cartRepoImp;
  AddToCartCubit({required this.cartRepoImp}) : super(AddToCartInitial());
  Future<void> addToCart({
    required ProductModel product,
    required int userId,
    required int quantity,
  }) async {
    emit(AddToCartLoading());
    final result = await cartRepoImp.addToCart(
      product: product,
      userId: userId,
      quantity: quantity,
    );
    result.fold(
      (failure) => emit(AddToCartFailure(errorMessage: failure.errormessage)),
      (_) => emit(AddToCartSuccess()),
    );
  }
}
